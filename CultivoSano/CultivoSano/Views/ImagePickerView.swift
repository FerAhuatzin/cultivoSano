import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType // Agregar propiedad para definir el origen de la imagen
    private let preprocessingService = ImagePreprocessingService() // Instancia del servicio de preprocesamiento

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType // Establecer el tipo de fuente según el valor pasado
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView

        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                print("Imagen seleccionada correctamente.")

                // Aplicar el preprocesamiento a la imagen seleccionada
                if let preprocessedImage = parent.preprocessingService.preprocessImage(image) {
                    parent.selectedImage = preprocessedImage
                    print("Imagen preprocesada correctamente.")
                } else {
                    print("Error: No se pudo preprocesar la imagen.")
                }
            } else {
                print("Error: No se pudo seleccionar la imagen.")
            }
            picker.dismiss(animated: true)
        }
    }
}
