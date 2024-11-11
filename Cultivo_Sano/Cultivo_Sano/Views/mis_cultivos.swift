/*import SwiftUI

struct Cultivo: Identifiable {
    let id = UUID()
    let nombre: String
    let especie: String  // Agregado para la especie
    let ubicacion: String
}

struct MisCultivosView: View {
    @State private var nombreCultivo: String = ""
    @State private var especieCultivo: String = ""
    @State private var ubicacionCultivo: String = ""
    @State private var showImagePicker = false
    @State private var imageSource: UIImagePickerController.SourceType = .camera 
    @State private var selectedImage: UIImage?

    @State private var cultivos: [Cultivo] = [
        Cultivo(nombre: "Cultivo de Santa María", especie: "Maíz", ubicacion: "Puebla, Sta. María del Río"),
        Cultivo(nombre: "Cultivo de mi Hijo Pedro", especie: "Frijol", ubicacion: "Puebla, Valle de Huejotzingo"),
        Cultivo(nombre: "Cultivo 1", especie: "Trigo", ubicacion: "Tlaxcala, Tlaxcala de Xicotencatl")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Mis Cultivos")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                        .padding(.horizontal, 30)
                    Spacer()
                }
                
                // Formulario para agregar un nuevo cultivo
                Form {
                    TextField("Nombre del cultivo", text: $nombreCultivo)
                    TextField("Especie", text: $especieCultivo)
                    TextField("Ubicación", text: $ubicacionCultivo)
                    HStack{
                        
                        Button(action: {
                            let nuevoCultivo = Cultivo(nombre: nombreCultivo, especie: especieCultivo, ubicacion: ubicacionCultivo)
                            cultivos.append(nuevoCultivo)
                            showImagePicker = true
                            imageSource = .camera
                            // Limpiar los campos del formulario
                            nombreCultivo = ""
                            especieCultivo = ""
                            ubicacionCultivo = ""
                        }) {
                            Text("Tomar foto")
                        }
                        .padding(.trailing)
                        .buttonStyle(.bordered)
                        
                        Button(action: {
                            // Acción para abrir la galería
                            showImagePicker = true
                            imageSource = .photoLibrary
                        }) {
                            
                            Text("Seleccionar imagen")
                        }
                        .buttonStyle(.bordered)
                    }
                }
                
                // Lista de cultivos
                List(cultivos) { cultivo in
                    HStack {
                        Image("location_on")
                            .foregroundColor(.red)
                            .padding(.trailing, 8)
                        
                        VStack(alignment: .leading) {
                            Text(cultivo.nombre)
                                .font(.headline)
                            Text(cultivo.especie)  // Mostrar la especie
                                .font(.subheadline)
                            Text(cultivo.ubicacion)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(selectedImage: $selectedImage, sourceType: imageSource)
            }
        }
    }
}

struct MisCultivosView_Previews: PreviewProvider {
    static var previews: some View {
        MisCultivosView()
    }
}
*/
