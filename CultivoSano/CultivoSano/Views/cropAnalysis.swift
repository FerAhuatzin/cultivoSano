import SwiftUI

struct CropAnalysis: View {
    @ObservedObject var viewModel: CropHealthDataHandlerService
    var capturedImage: UIImage? // Imagen capturada
    var cropName: String // Nombre del cultivo
    var cropSpecies: String // Especie del cultivo
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    if let capturedImage = capturedImage {
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
                        Text(cropName)
                            .font(.title)
                        Text("\(cropSpecies), Puebla, México")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.top)

                // Sección de recomendaciones de plagas
                DisclosureGroup {
                    Text(viewModel.recomendacion?.descripcion ?? "No hay detección de plagas disponible.")
                        .padding(.vertical)
                } label: {
                    Text("Detección de la plaga")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Recomendaciones específicas
                DisclosureGroup {
                    Text(viewModel.recomendacion?.recomendacion ?? "No hay recomendaciones disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Estrategias ecológicas
                DisclosureGroup {
                    Text(viewModel.recomendacion?.recomendacionEcologica ?? "No hay estrategias ecológicas disponibles.")
                        .padding(.vertical)
                } label: {
                    Text("Estrategias ecológicas")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Recomendaciones climáticas
                DisclosureGroup {
                    Text(viewModel.recomendacion?.climateRecommendation ?? "No hay recomendaciones climáticas disponibles.")
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
