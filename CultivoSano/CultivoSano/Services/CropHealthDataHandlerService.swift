import Foundation
import CoreLocation
import SwiftUI
import CoreML
import Vision

class CropHealthDataHandlerService: ObservableObject {
    @Published var cropHealthDescription: String = "No diagnosis yet"
    @Published var selectedImage: UIImage? = nil
    @Published var userLocation: CLLocation? = nil
    @Published var cityName: String = ""
    
    private let cropIdentifierService = CropIdentifierService()
    private let locationService = LocationService()
    
    // Variable predeterminada para la humedad
    private let humedadPredeterminada: Double = 80.0
    
    init() {
        locationService.startUpdatingLocation()
        locationService.$userLocation.assign(to: &$userLocation)
        locationService.$cityName.assign(to: &$cityName)
    }
    
    func updateLocation() {
        locationService.startUpdatingLocation()
    }
    
    func diagnoseCropHealth(temperatura: Double, especie: String) {
        guard let image = selectedImage else {
            cropHealthDescription = "Error: Imagen no seleccionada."
            return
        }
        
        cropIdentifierService.predict(image: image) { [weak self] identifier in
            guard let identifier = identifier else {
                self?.cropHealthDescription = "No se pudo obtener un resultado del modelo."
                return
            }
            
            // Imprimir la predicción en la consola para depuración
            print("Predicción del modelo: \(identifier)")
            
            // Actualizar la descripción con la predicción obtenida
            DispatchQueue.main.async {
                self?.cropHealthDescription = "Predicción: \(identifier)"
            }
        }
    }
}
