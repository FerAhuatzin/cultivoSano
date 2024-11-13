import SwiftUI

struct Crop: Identifiable {
    var id = UUID()
    var name: String
    var species: String
    var location: String
    var latitude: Double?
    var longitude: Double?
    var image: Image
    var capturedImage: UIImage?
    var recomendacion: Recomendacion?
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


