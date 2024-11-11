import SwiftUI

struct CropAnalysis: View {
    @ObservedObject var viewModel: CropHealthDataHandlerService // Recibe el viewModel para mostrar los datos
    @State private var isPestDetectionOpen = true // Estado para la sección de detección de plagas

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("wheatImage")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .foregroundStyle(Color("MainColor"))
                        .padding(.trailing, 20)
                    VStack(alignment: .leading) {
                        Text("Cultivo Santa Catarina")
                            .font(.title)
                        Text("Trigo, Puebla, México")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.top)

                // Detección de plaga
                DisclosureGroup {
                    Text(viewModel.cropHealthDescription.isEmpty ? "Sin detección de plagas disponible." : viewModel.cropHealthDescription)
                        .padding(.vertical)
                } label: {
                    Text("Detección de la plaga")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Recomendaciones
                DisclosureGroup {
                    Text(viewModel.cropHealthDescription.isEmpty ? "No hay recomendaciones disponibles." : viewModel.cropHealthDescription)
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                // Estrategias ecológicas
                DisclosureGroup {
                    VStack(alignment: .leading) {
                        Text(viewModel.cropHealthDescription.isEmpty ? "No hay estrategias ecológicas disponibles." : viewModel.cropHealthDescription)
                    }
                    .padding(.vertical)
                } label: {
                    Text("Estrategias ecológicas")
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

#Preview {
    CropAnalysis(viewModel: CropHealthDataHandlerService())
}
