
import Foundation
import CoreLocation
import WeatherKit
/*
class Weather {
    let weatherService = WeatherService.shared
    
    func fetchWeatherData(latitude: Double, longitude: Double) async {
        do {
            let location = CLLocation(latitude: latitude, longitude: longitude)
            let now = Date()
            let previous =  Calendar.current.date(byAdding: .day, value: -7, to: now)!
            let interval = DateInterval(start: previous, end: now)
            let weather = try await weatherService.weather(for: location)
            let (humidity, temperature) = try await weatherService.monthlyStatistics(for: location, forMonthsIn: interval, including: .precipitation, .temperature)
        } catch {
            // Maneja errores
            print("Error fetching weather data: \(error)")
        }
    }
}*/
