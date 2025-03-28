//
//  ImageUseCase.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 25/3/25.
//

import UIKit

protocol ImageUseCase {
    func filterVibrance(from image: UIImage, vibrance: Float, isOpaque: Bool, completion: @escaping (UIImage?) -> Void)
    func applyCLAHE(image: UIImage, isOpaque: Bool, completion: @escaping (UIImage?) -> Void)
}
