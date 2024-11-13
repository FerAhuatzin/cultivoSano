import Foundation
import WeatherKit
import CoreLocation
import SwiftUI

@MainActor
class WeatherManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentWeather: Weather? // Variable publicada para actualizar la vista
    private let weatherService = WeatherService()
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // Método para obtener el clima para una ubicación específica
    func fetchWeather(for location: CLLocation) async {
        do {
            let weather = try await weatherService.weather(for: location) // Obtiene el clima
            DispatchQueue.main.async {
                self.currentWeather = weather // Actualiza el clima en la vista
            }
        } catch {
            print("Error al obtener el clima: \(error)") // Manejo de errores
        }
    }

    // Delegate para recibir la ubicación
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        Task {
            await fetchWeather(for: location) // Obtiene el clima para la primera ubicación
        }
    }
}

