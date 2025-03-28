//
//  ImplImageUseCase.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 25/3/25.
//

import Foundation
import UIKit

final class ImplImageUseCase: ImageUseCase {
    
    private let vibranceService: VibranceFilterService
    private let claheService: CLAHEFilterService
    
    init(vibranceService: VibranceFilterService, claheService: CLAHEFilterService) {
        self.claheService = claheService
        self.vibranceService = vibranceService
    }
    
    func filterVibrance(from image: UIImage, vibrance: Float, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        vibranceService.applyVibrance(from: image, vibrance: vibrance, isOpaque: isOpaque, completion: completion)
    }
    
    func applyCLAHE(image: UIImage, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        claheService.applyCLAHE(image: image, isOpaque: isOpaque, completion: completion)
    }
}
