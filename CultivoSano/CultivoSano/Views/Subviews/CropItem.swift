import SwiftUI

struct Crop: Identifiable {
    let id = UUID()
    let name: String
    let species: String
    let location: String
    let image: Image
}

struct CropItem: View {
    var crop: Crop

    var body: some View {
        NavigationLink(destination: CropAnalysis()) {
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
                .padding()

                Spacer()

                crop.image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.horizontal, 10)
            }
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    CropItem(crop: Crop(name: "Cultivo Santa Catarina", species: "Trigo", location: "Cholula, México", image: Image("wheatImage")))
}

