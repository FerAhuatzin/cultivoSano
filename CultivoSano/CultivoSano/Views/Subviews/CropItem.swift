import SwiftUI

struct Crop: Identifiable {
    let id = UUID()
    let name: String
    let species: String
    let location: String
    let image: Image
    let capturedImage: UIImage?
    var recomendacion: Recomendacion? // Nueva propiedad para almacenar la recomendación
}




struct CropItem: View {
    var crop: Crop
    var viewModel: CropHealthDataHandlerService // Recibe el viewModel como parámetro

    var body: some View {
        NavigationLink(destination: CropAnalysis(crop: crop)) { // Pasa el viewModel y los datos necesarios a CropAnalysis
            HStack {
                VStack(alignment: .leading) {
                    Text(crop.name)
                        .font(.headline)
                    Text(crop.species)
                        .font(.subheadline)
                    Text(crop.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()

                crop.image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.horizontal, 10)
            }
            .padding(.horizontal, 15) // Aplicar padding general al HStack
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    let viewModel = CropHealthDataHandlerService()
    CropItem(crop: Crop(name: "Cultivo Santa Catarina", species: "Trigo", location: "Cholula, México", image: Image("wheatImage"), capturedImage: UIImage(named: "wheatImage")), viewModel: viewModel)
}
