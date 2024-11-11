import SwiftUI

struct CropAnalysis: View {
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
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.top)

                DisclosureGroup {
                    Text("Durante la última revisión, se observó una ligera infestación de pulgones en las hojas superiores. Aunque aún no es crítica, es importante actuar rápidamente para evitar que se propague.")
                        .padding(.vertical)
                } label: {
                    Text("Detección de la plaga")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)
                .onAppear {
                    // Abrir la sección al iniciar
                    isPestDetectionOpen = true
                }
                .background(Group {
                    // Configuración para que la sección esté abierta al inicio
                    if isPestDetectionOpen {
                        EmptyView()
                    } else {
                        EmptyView()
                    }
                })

                DisclosureGroup {
                    Text("Tomando en cuenta las altas temperaturas que hemos estado experimentando en Puebla, los pulgones tienden a multiplicarse más rápido. Te sugerimos aplicar un insecticida biológico. Te recomendamos usar aceite de neem, que es efectivo y menos dañino para el medio ambiente. Asegúrate de cubrir bien ambas caras de las hojas, ya que los pulgones suelen esconderse ahí.")
                        .padding(.vertical)
                } label: {
                    Text("Recomendaciones")
                        .foregroundColor(Color("MainColor"))
                        .font(.title2)
                }
                .padding(.top)

                DisclosureGroup {
                    VStack(alignment: .leading) {
                        Text("Considera plantar flores que atraigan mariquitas y otros depredadores naturales de pulgones. Esto ayudará a mantener la población de plagas bajo control de forma natural.")
                        Text("Igual si se cambian los cultivos de lugar cada temporada puede interrumpir el ciclo de vida de las plagas y prevenir futuras infestaciones. Piensa en alternar el trigo con legumbres, que también enriquecerán el suelo.")
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
    CropAnalysis()
}
