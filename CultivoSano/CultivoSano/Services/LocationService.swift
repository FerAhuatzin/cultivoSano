import Foundation
import CoreLocation

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation?
    @Published var cityName: String = "" // Esta variable sera la que mostrara el nombre de la ciudad
    
    private var locationManager: CLLocationManager?
    
    private let geocoder = CLGeocoder() 
    
    override init() {
        super.init()
        setupLocationManager()
        
    }
    
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.allowsBackgroundLocationUpdates = true
    }
    
    func startUpdatingLocation() {
        locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.userLocation = location
                self.getCityAndState(from: location) //Aqui llamamos al metodo getCityAndState con la variable location que almacena Lat y Lng
              
            }
        }
    }
    //Funcion para obtener ciudad y estado basado en lat y lang.
    private func getCityAndState(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let placemark = placemarks?.first, error == nil {
                // Extraer la información del primer resultado
                let city = placemark.locality ?? "Ciudad desconocida"
                let state = placemark.administrativeArea ?? "Estado desconocido"
                DispatchQueue.main.async {
                    self.cityName = "\(city), \(state)"
                }
            } else {
                //Manejo de errores
                print("Error al obtener la ubicación: \(String(describing: error))")
            }
        }
    }
}

