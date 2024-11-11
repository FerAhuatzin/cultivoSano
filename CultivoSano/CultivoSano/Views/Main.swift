import SwiftUI

struct Main: View {
    @State private var crop_name: String = ""
    @State private var species_of_crop: String = ""
    @State private var showImagePicker = false
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var showAlert = false
    @StateObject private var viewModel = CropHealthDataHandlerService()
    
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
                
                // Mostrar la predicción en la interfaz
                if !viewModel.cropHealthDescription.isEmpty {
                    Text(viewModel.cropHealthDescription)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal, 30)
                }
                
                // Lista de cultivos agregados
                ScrollView {
                    VStack {
                        ForEach(crops) { crop in
                            CropItem(crop: crop, viewModel: viewModel)
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
                    // Actualizar la imagen seleccionada en el servicio
                    viewModel.selectedImage = selectedImage
                    viewModel.diagnoseCropHealth(temperatura: 25, especie: species_of_crop)
                    
                    // Crear el nuevo cultivo con las recomendaciones
                    let nuevoCultivo = Crop(
                        name: crop_name,
                        species: species_of_crop,
                        location: "Puebla, México",
                        image: Image(uiImage: selectedImage!)
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
