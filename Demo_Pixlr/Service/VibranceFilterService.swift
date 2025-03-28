//
//  VibranceFilterService.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 25/3/25.
//

import Foundation
import MetalPetal

final class VibranceFilterService {
    private var context: MTIContext?
    init() {
        guard let device = MTLCreateSystemDefaultDevice(),
              let context = try? MTIContext(device: device) else { return }
        self.context = context
    }
    
    func applyVibrance(from image: UIImage, vibrance: Float, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        guard let ciImage = CIImage(image: image) else { return }
        let inputImage = MTIImage(ciImage: ciImage, isOpaque: isOpaque)
        
        let vibranceFilter = MTIVibranceFilter()
        
        DispatchQueue.global(qos: .userInitiated).async {
            vibranceFilter.inputImage = inputImage
            vibranceFilter.amount = vibrance  // Adjust vibrance (-1.0 to 1.0)
            
            if let outputImage = vibranceFilter.outputImage,
               let cgImage = try? self.context?.makeCGImage(from: outputImage) {
                DispatchQueue.main.async {
                    completion(UIImage(cgImage: cgImage))
                }
            }
        }
    }
}
