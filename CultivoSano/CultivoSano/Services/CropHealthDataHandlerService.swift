import SwiftUI
import Foundation
import CoreML

class CropHealthDataHandlerService: ObservableObject {
    @Published var cropHealthDescription: String = "No diagnosis yet"
    @Published var recomendacion: Recomendacion?
    @Published var selectedImage: UIImage? = nil

    private let cropIdentifierService = CropIdentifierService()
    
    func diagnoseCropHealth(especie: String) {
        guard let image = selectedImage else {
            cropHealthDescription = "Error: Imagen no seleccionada."
            return
        }
        
        // Obtener diagnóstico del modelo usando solo la imagen
        cropIdentifierService.predict(image: image) { [weak self] diagnosis in
            guard let self = self, let diagnosis = diagnosis else {
                self?.cropHealthDescription = "No se pudo obtener un diagnóstico del modelo."
                return
            }
            
            // Almacenar el diagnóstico en cropHealthDescription
            DispatchQueue.main.async {
                self.cropHealthDescription = diagnosis
                
                // Obtener recomendaciones con el diagnóstico obtenido y la especie seleccionada
                let recomendaciones = obtenerRecomendacion(especie: especie, enfermedad: diagnosis)
                
                // Asignar la recomendación al objeto
                self.recomendacion = Recomendacion(
                    descripcionEnfermedad: recomendaciones["descripcion_enfermedad"] ?? "",
                    descripcion: recomendaciones["descripcion"] ?? "",
                    recomendacion: recomendaciones["recomendacion"] ?? "",
                    recomendacionEcologica: recomendaciones["recomendacion_ecologica"] ?? "",
                    climateRecommendation: recomendaciones["climateRecommendation"] ?? ""
                )
            }
        }
    }
}
