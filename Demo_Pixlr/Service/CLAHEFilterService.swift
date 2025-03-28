//
//  CLAHEFilterService.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 25/3/25.
//

import Foundation
import MetalPetal

final class CLAHEFilterService {
    
    private var context: MTIContext?
    
    init() {
        
        guard let device = MTLCreateSystemDefaultDevice(),
              let context = try? MTIContext(device: device) else { return }
        self.context = context
    }
    
    func applyCLAHE(image: UIImage, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        guard let inputCIImage = CIImage(image: image) else { return }
        let inputMTIImage = MTIImage(ciImage: inputCIImage, isOpaque: isOpaque)

        let filter = MTICLAHEFilter()
        filter.clipLimit = 2
        DispatchQueue.global(qos: .userInitiated).async {
            filter.inputImage = inputMTIImage
            if let outputImage = filter.outputImage,
               let cgImage = try? self.context?.makeCGImage(from: outputImage) {
                DispatchQueue.main.async {
                    completion(UIImage(cgImage: cgImage))
                }
            }
        }
    }
}
