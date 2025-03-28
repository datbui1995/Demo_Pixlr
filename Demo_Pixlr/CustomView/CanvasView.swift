//
//  CanvasView.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 24/3/25.
//

import Foundation
import UIKit

class CanvasView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        layer.borderColor = UIColor.cyan.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
    
    func drawSquare(listSquare: [CGRect]) {
        for square in listSquare {
            let rectanglePath = UIBezierPath(rect: square)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = rectanglePath.cgPath
            shapeLayer.strokeColor = UIColor.orange.cgColor
            shapeLayer.fillColor = UIColor.white.cgColor
            shapeLayer.lineWidth = 1
            self.layer.addSublayer(shapeLayer)
            
            // Animation
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1.5
            shapeLayer.add(animation, forKey: "animation")
        }
    }
    
    func removeAll() {
        self.subviews.forEach{ $0.removeFromSuperview() }
        self.layer.sublayers?.removeAll()
    }
    
    func addImageView(at rect: CGRect, with image: UIImage) {
        let imageView = UIImageView(frame: rect)
        imageView.image = image
        self.addSubview(imageView)
    }
}
