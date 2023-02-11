//
//  UIColor+Extension.swift
//  waither
//
//  Created by 김유빈 on 2023/01/01.
//

import UIKit

extension UIColor {
    static let buttonColor = UIColor (
        red: 0.318,
        green: 0.537,
        blue: 0.965,
        alpha: 1.0)
    
    static let warningLabelColor = UIColor (
        red: 1,
        green: 0.306,
        blue: 0,
        alpha: 1.0)
    
    static let disabledButtonColor = UIColor (
        red: 0.878,
        green: 0.882,
        blue: 0.894,
        alpha: 1.0)
}

extension CALayer {
    func addGradientBorder(colors:[UIColor],width:CGFloat = 1) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 16
        gradientLayer.frame =  CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: self.bounds.size)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = colors.map({$0.cgColor})

        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.cornerRadius = 16
        gradientLayer.mask = shapeLayer

        self.addSublayer(gradientLayer)
    }

}
