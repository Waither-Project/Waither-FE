//
//  UIView+Extension.swift
//  waither
//
//  Created by 김유빈 on 2023/01/01.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // 모따기
        get {
            return layer.cornerRadius // 값을 읽어올 때에는 얼마만큼 둥글게 표현이 되어있는지 수치를 가져옴
        }
        set {
            layer.cornerRadius = newValue // 값을 세팅하게 될 때
            layer.masksToBounds = newValue > 0
        }
    }
}
