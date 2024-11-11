import UIKit
import CoreImage
import CoreML
import Vision

class ImagePreprocessingService {
    
    func preprocessImage(_ image: UIImage) -> UIImage? {
        // Paso 1: Redimensionar a 360x360
        let resizedImage = resizeImage(image, targetSize: CGSize(width: 360, height: 360))
        
        // Paso 2: Ajuste de contraste
        guard let contrastAdjustedImage = adjustContrast(image: resizedImage, contrastFactor: 1.4) else { return nil }
        
        // Paso 3: Aplicar Gaussian Blur
        let smoothedImage = applyGaussianBlur(image: contrastAdjustedImage)
        
        return smoothedImage
    }
    
    private func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    private func adjustContrast(image: UIImage, contrastFactor: Float) -> UIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        let contrastFilter = CIFilter(name: "CIColorControls")
        contrastFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        contrastFilter?.setValue(contrastFactor, forKey: kCIInputContrastKey)
        
        guard let output = contrastFilter?.outputImage else { return nil }
        let context = CIContext()
        if let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
    
    private func applyGaussianBlur(image: UIImage) -> UIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(4, forKey: kCIInputRadiusKey)  // Ajusta el radio según lo necesario
        
        guard let output = blurFilter?.outputImage else { return nil }
        let context = CIContext()
        if let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
}
