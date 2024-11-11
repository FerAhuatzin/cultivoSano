import Foundation
import UIKit

class CropHealthService {
    private let apiKey = "tWuZxdk8I0Zb4mAARCwHGMRX3l90ewkdeubDNRFbL4dVjgRtkA"
    private let apiUrl = "https://crop.kindwise.com/api/v1/identification" // Endpoint proporcionado

    func identifyCropHealth(image: UIImage, latitude: Double, longitude: Double, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Convertir UIImage a Data y luego a base64
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to convert image to JPEG data."])))
            return
        }
        let imageBase64 = "data:image/jpeg;base64," + imageData.base64EncodedString()

        // Crear la URL para la solicitud
        guard let url = URL(string: apiUrl) else {
            completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."])))
            return
        }

        // Configurar la solicitud
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "Api-Key")

        // Crear el cuerpo de la solicitud
        let jsonRequest: [String: Any] = [
            "images": [imageBase64],
            "latitude": latitude,
            "longitude": longitude,
            "similar_images": true
        ]

        // Convertir el cuerpo a JSON
        guard let httpBody = try? JSONSerialization.data(withJSONObject: jsonRequest, options: []) else {
            completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to serialize JSON request body."])))
            return
        }
        request.httpBody = httpBody

        // Realizar la solicitud HTTP
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error al realizar la solicitud: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("Error: No se recibieron datos del servidor.")
                completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data returned from the server."])))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Código de estado HTTP: \(httpResponse.statusCode)")
            }

            // Intentar decodificar la respuesta JSON
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Respuesta JSON recibida: \(jsonResponse)")
                    
                    if let status = jsonResponse["status"] as? String, status == "COMPLETED" {
                        // Considerar toda la respuesta como útil
                        completion(.success(jsonResponse))
                    } else {
                        print("Error: Estado no completado en la respuesta.")
                        completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response status not completed."])))
                    }
                } else {
                    print("Error: La respuesta no se pudo interpretar como JSON.")
                    completion(.failure(NSError(domain: "CropHealthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response not in expected JSON format."])))
                }
            } catch {
                print("Error al decodificar la respuesta JSON: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
