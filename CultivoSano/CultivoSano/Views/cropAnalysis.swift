import SwiftUI

struct CropAnalysis: View {
    var crop: Crop // Cambia para recibir el objeto Crop completo

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
                
                // Descripción de la enfermedad (descripcionEnfermedad)
                if let descripcionEnfermedad = crop.recomendacion?.descripcionEnfermedad {
                    Text(descripcionEnfermedad)
                        .font(.headline)
                        .foregroundColor(
                            descripcionEnfermedad.contains("saludable") ? Color("MainColor") : .red
                        )
                        .padding(.top, 10)
                        .padding(.horizontal)
                }

                // Usar la recomendación específica del cultivo
                DisclosureGroup {
                    Text(crop.recomendacion?.descripcion ?? "No hay detección de plagas disponible.")
                        .padding(.vertical)
                } label: {
                    Text("Detección de la plaga")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Recomendaciones específicas
                DisclosureGroup {
                    Text(crop.recomendacion?.recomendacion ?? "No hay recomendaciones disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)
                
                // Estrategias ecológicas
                DisclosureGroup {
                    Text(crop.recomendacion?.recomendacionEcologica ?? "No hay estrategias ecológicas disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Estrategias ecológicas")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                DisclosureGroup {
                    Text(crop.recomendacion?.climateRecommendation ?? "No hay recomendaciones climáticas disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones climáticas")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)
            }
        }
        .padding(.horizontal, 30)
        .padding(.top)
    }
}

