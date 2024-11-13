import SwiftUI
import CoreLocation

struct CropAnalysis: View {
    var crop: Crop
    @State private var isClimateSectionExpanded = false // Estado para rastrear la expansión de la sección climática
    @StateObject private var weatherManager = WeatherManager() // Instancia de WeatherManager
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    if let capturedImage = crop.capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding(.trailing, 20)
                    } else {
                        Image("defaultImage")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding(.trailing, 20)
                    }

                    VStack(alignment: .leading) {
                        Text(crop.name)
                            .font(.title)
                        Text("\(crop.species), \(crop.location)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                if let descripcionEnfermedad = crop.recomendacion?.descripcionEnfermedad {
                    Text(descripcionEnfermedad)
                        .font(.headline)
                        .foregroundColor(
                            descripcionEnfermedad.contains("saludable") ? Color("MainColor") : .red
                        )
                        .padding(.top, 10)
                        .padding(.horizontal)
                }

                DisclosureGroup {
                    Text(crop.recomendacion?.descripcion ?? "No hay detección de plagas disponible.")
                        .padding(.vertical)
                } label: {
                    Text("Detección de la plaga")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                DisclosureGroup {
                    Text(crop.recomendacion?.recomendacion ?? "No hay recomendaciones disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)
                
                DisclosureGroup {
                    Text(crop.recomendacion?.recomendacionEcologica ?? "No hay estrategias ecológicas disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Estrategias ecológicas")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                
                // Recomendaciones climáticas
                DisclosureGroup(isExpanded: $isClimateSectionExpanded) {
                    if let temperature = weatherManager.currentWeather?.currentWeather.temperature.value,
                       let condition = weatherManager.currentWeather?.currentWeather.condition.description {
                        Text("Clima actual: \(temperature)°C, \(condition)")
                            .padding(.vertical)
                    } else {
                        Text("No se pudo obtener el clima.")
                            .padding(.vertical)
                    }
                } label: {
                    Text("Recomendaciones climáticas")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)
                .onChange(of: isClimateSectionExpanded) { expanded in
                    if expanded, let latitude = crop.latitude, let longitude = crop.longitude {
                        // Obtiene el clima solo si la sección se expande y si existen coordenadas
                        let location = CLLocation(latitude: latitude, longitude: longitude)
                        Task {
                            await weatherManager.fetchWeather(for: location)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top)
    }
}

