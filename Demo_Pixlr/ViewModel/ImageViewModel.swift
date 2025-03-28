//
//  ImageViewModel.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 22/3/25.
//

import Foundation
import UIKit

protocol ImageViewModel {
    var numberOfSquareEdgeItems: CGFloat { get set }
    var listSquare: [CGRect] { get set }
    func makeListSquare(numberOfSquareEdgeItems: CGFloat)
    func getSelectedRect(at index: Int) -> CGRect
    func filterVibrance(from image: UIImage, vibrance: Float, isOpaque: Bool, completion: @escaping (UIImage?) -> Void)
    func applyCLAHE(image: UIImage, isOpaque: Bool, completion: @escaping (UIImage?) -> Void)
    func getImage() -> UIImage
}

final class ImplImageViewModel: ImageViewModel {
    
    var numberOfSquareEdgeItems: CGFloat = 2
    var listSquare: [CGRect] = []
    private let useCase: ImageUseCase
    
    init(useCase: ImageUseCase) {
        self.useCase = useCase
    }
    
    func makeListSquare(numberOfSquareEdgeItems: CGFloat) {
        var list: [CGRect] = []
        let dimension = (Utils.canvasWidth - Utils.canvasPadding * (numberOfSquareEdgeItems + 1)) / numberOfSquareEdgeItems
        let points = makePoints(numberOfSquareEdgeItems: numberOfSquareEdgeItems, dimension: dimension)
        
        for (_, point) in points.enumerated() {
            list.append(CGRect(x: point.x, y: point.y, width: dimension, height: dimension))
        }
        
        self.numberOfSquareEdgeItems = numberOfSquareEdgeItems
        self.listSquare = list
    }
    
    func getSelectedRect(at index: Int) -> CGRect {
        listSquare[index]
    }
    
    func filterVibrance(from image: UIImage, vibrance: Float, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        useCase.filterVibrance(from: image, vibrance: vibrance, isOpaque: isOpaque, completion: completion)
    }
    
    func applyCLAHE(image: UIImage, isOpaque: Bool, completion: @escaping (UIImage?) -> Void) {
        useCase.applyCLAHE(image: image, isOpaque: isOpaque, completion: completion)
    }
    
    func getImage() -> UIImage {
        UIImage(named: "image_1") ?? UIImage()
    }
    
}

private extension ImplImageViewModel {
    func makePoints(numberOfSquareEdgeItems: CGFloat, dimension: CGFloat) -> [CGPoint] {
        var listDrawingPoint: [CGPoint] = []
        let originalPoint = CGPoint(x: Utils.canvasPadding, y: Utils.canvasPadding)
        
        for column in 0..<Int(numberOfSquareEdgeItems) {
            for row in 0..<Int(numberOfSquareEdgeItems) {
                let x = originalPoint.x + (dimension + Utils.canvasPadding) * CGFloat(row)
                let y = originalPoint.y + (dimension + Utils.canvasPadding) * CGFloat(column)
                listDrawingPoint.append(CGPoint(x: x, y: y))
            }
        }
        return listDrawingPoint
    }
}
