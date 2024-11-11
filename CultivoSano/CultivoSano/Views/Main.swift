import SwiftUI

struct Main: View {
    @State private var crop_name: String = ""
    @State private var species_of_crop: String = ""
    @State private var showImagePicker = false
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    
    // Lista para almacenar los cultivos
    @State private var crops: [Crop] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Hola NOMBRE")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                }
                .padding(.top,50)
                .padding(.horizontal, 30)
                
                // Campos de texto
                VStack {
                    TextField("Nombre de cultivo", text: $crop_name)
                        .padding(.horizontal, 30)
                        .padding(.top)
                        .keyboardType(.default)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal, 30)
                }
                .padding(.bottom, 10)
                
                VStack {
                    TextField("Especie de cultivo", text: $species_of_crop)
                        .padding(.horizontal, 30)
                        .padding(.top)
                        .keyboardType(.default)
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal, 30)
                }
                .padding(.bottom, 30)
                
                // Botón para abrir la cámara
                Button(action: {
                    imageSource = .camera
                    showImagePicker = true
                }) {
                    Spacer()
                    Image(systemName: "camera.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("MainColor"))
                        .padding(.leading, 40)
                    Text("Comenzar a analizar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(Color("MainColor"))
                        .padding(.trailing, 40)
                    Spacer()
                }
                .overlay(
                    Rectangle()
                        .stroke(Color("MainColor"), lineWidth: 2)
                )
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
                
                // Botón para seleccionar una imagen de la galería
                Button(action: {
                    imageSource = .photoLibrary
                    showImagePicker = true
                }) {
                    Spacer()
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("MainColor"))
                        .padding(.leading, 40)
                    Text("Elegir de la Galería")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(Color("MainColor"))
                        .padding(.trailing, 40)
                    Spacer()
                }
                .overlay(
                    Rectangle()
                        .stroke(Color("MainColor"), lineWidth: 2)
                )
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                // Lista de cultivos agregados
                ScrollView {
                    VStack {
                        ForEach(crops) { crop in
                            CropItem(crop: crop)
                            Divider()
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                // Verificar que el nombre, especie y la imagen estén completos antes de agregar el cultivo
                if !crop_name.isEmpty && !species_of_crop.isEmpty && selectedImage != nil {
                    // Agregar un nuevo cultivo con la ubicación predefinida (puedes cambiarla si es necesario)
                    let uiImage = selectedImage!
                    let newImage = Image(uiImage: uiImage)
                    let nuevoCultivo = Crop(
                        name: crop_name,
                        species: species_of_crop,
                        location: "Puebla, México", // Cambia esto si deseas una ubicación dinámica
                        image: newImage
                    )
                    crops.append(nuevoCultivo)
                    
                    // Limpiar los campos y la imagen seleccionada
                    crop_name = ""
                    species_of_crop = ""
                    selectedImage = nil
                }
            }) {
                ImagePickerView(selectedImage: $selectedImage, sourceType: imageSource)
            }
        }
    }
}

#Preview {
    Main()
}


