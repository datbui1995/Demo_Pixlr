//
//  RectangleView.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 22/3/25.
//

import Foundation
import UIKit

class RectangleView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.blue.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
    }
}
