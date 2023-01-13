//
//  UILabel.swift
//  waither
//
//  Created by 김유빈 on 2023/01/12.
//

import UIKit

// 자간 간격 조절
open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
}
