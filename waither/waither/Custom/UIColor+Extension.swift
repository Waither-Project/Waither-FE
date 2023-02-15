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
    
    static let cloudyGradientColor : [CGColor] = [
        UIColor(red: 0.7, green: 0.65, blue: 0.61, alpha: 0.7).cgColor,
        UIColor(red: 0.43, green: 0.515, blue: 0.583, alpha: 0.7).cgColor,
        UIColor(red: 0.463, green: 0.482, blue: 0.498, alpha: 0.7).cgColor
    ]
    
    static let cloudyNightGradientColor = [
        UIColor(red: 0.7, green: 0.65, blue: 0.61, alpha: 0.7).cgColor,
        UIColor(red: 0.032, green: 0.104, blue: 0.162, alpha: 0.7).cgColor,
        UIColor(red: 0.463, green: 0.482, blue: 0.498, alpha: 0.7).cgColor
    ]
    
    static let sunnyGradientColor = [
        UIColor(red: 0.813, green: 0.925, blue: 0.824, alpha: 0.7).cgColor,
        UIColor(red: 0.238, green: 0.661, blue: 1, alpha: 0.7).cgColor,
        UIColor(red: 0, green: 0.556, blue: 1, alpha: 0.7).cgColor
    ]
    
    static let sunnyNightGradientColor = [
        UIColor(red: 0.644, green: 0.655, blue: 0.925, alpha: 0.7).cgColor,
        UIColor(red: 0.081, green: 0.311, blue: 0.496, alpha: 0.7).cgColor,
        UIColor(red: 0.014, green: 0.038, blue: 0.058, alpha: 0.7).cgColor
    ]
}
