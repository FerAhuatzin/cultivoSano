import SwiftUI

struct Main: View {
    @State private var crop_name: String = ""
    @State private var species_of_crop: String = "" // Inicializado vacío para mostrar el mensaje
    @State private var showImagePicker = false
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var showAlert = false
    @StateObject private var viewModel = CropHealthDataHandlerService()
    
    // Lista para almacenar los cultivos
    @State private var crops: [Crop] = []
    let cropSpecies = ["Trigo", "Calabaza", "Frijol"]
    
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
                .padding(.top, 50)
                .padding(.horizontal, 30)
                
                // Campo de texto para el nombre del cultivo
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
                
                // Dropdown list para la especie del cultivo con mensaje predeterminado
                VStack {
                    HStack {
                        Text("Especie de cultivo")
                            .foregroundColor(species_of_crop.isEmpty ? .gray : .primary)
                            .padding(.leading, 30)
                        Spacer()
                        Picker("Especie de cultivo", selection: $species_of_crop) {
                            Text("Nombre de la especie").tag("")
                            ForEach(cropSpecies, id: \.self) { species in
                                Text(species).tag(species)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 30)
                    }
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal, 30)
                }
                .padding(.bottom, 30)
                
                // Botón para abrir la cámara
                Button(action: {
                    if crop_name.isEmpty || species_of_crop.isEmpty {
                        showAlert = true
                    } else {
                        imageSource = .camera
                        showImagePicker = true
                    }
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
                    if crop_name.isEmpty || species_of_crop.isEmpty {
                        showAlert = true
                    } else {
                        imageSource = .photoLibrary
                        showImagePicker = true
                    }
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
                            CropItem(crop: crop, viewModel: viewModel) // Solo pasa el crop y viewModel
                            Divider()
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Campos incompletos"),
                    message: Text("Por favor, rellena el nombre y la especie del cultivo antes de continuar."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                if !crop_name.isEmpty && !species_of_crop.isEmpty && selectedImage != nil {
                    let viewModel = CropHealthDataHandlerService() // Nueva instancia del servicio para cada cultivo
                    viewModel.selectedImage = selectedImage
                    viewModel.diagnoseCropHealth(especie: species_of_crop)
                    
                    // Espera a que el diagnóstico se complete en el servicio antes de asignar la recomendación
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Ajustar el tiempo según sea necesario
                        let nuevoCultivo = Crop(
                            name: crop_name,
                            species: species_of_crop,
                            location: "Puebla, México",
                            image: Image(uiImage: selectedImage!),
                            capturedImage: selectedImage,
                            recomendacion: viewModel.recomendacion // Asignar recomendación después del diagnóstico
                        )
                        crops.append(nuevoCultivo)
                        
                        // Limpiar los campos
                        crop_name = ""
                        species_of_crop = ""
                        selectedImage = nil
                    }
                }
            })

            {
                ImagePickerView(selectedImage: $selectedImage, sourceType: imageSource)
            }
        }
    }
}

#Preview {
    Main()
}
