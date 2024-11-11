import CoreML
import Vision
import UIKit

class CropIdentifierService {
    private var model: CropClassification?

    // Inicializador para cargar el modelo CoreML
    init() {
        do {
            self.model = try CropClassification(configuration: MLModelConfiguration())
            print("Modelo cargado correctamente")
        } catch {
            print("Error al cargar el modelo CoreML: \(error.localizedDescription)")
        }
    }

    func predict(image: UIImage, completion: @escaping (String?) -> Void) {
        guard let model = model else {
            print("Error: modelo no disponible.")
            completion(nil)
            return
        }

        guard let ciImage = CIImage(image: image) else {
            print("Error: no se pudo convertir UIImage a CIImage")
            completion(nil)
            return
        }

        // Crear el modelo Vision a partir del modelo CoreML
        guard let visionModel = try? VNCoreMLModel(for: model.model) else {
            print("Error: no se pudo crear el modelo Vision")
            completion(nil)
            return
        }

        // Crear la solicitud Vision para realizar la predicción
        let request = VNCoreMLRequest(model: visionModel) { request, error in
            if let error = error {
                print("Error al realizar la predicción: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let results = request.results as? [VNClassificationObservation],
                  let bestResult = results.first else {
                print("Error: no se encontraron resultados")
                completion(nil)
                return
            }

            completion(bestResult.identifier) // Devuelve el identificador de la enfermedad
        }

        // Realizar la solicitud de predicción
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Error al realizar la solicitud: \(error.localizedDescription)")
            completion(nil)
        }
    }
}
