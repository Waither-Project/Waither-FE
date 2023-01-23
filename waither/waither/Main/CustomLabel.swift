//
//  CustomLabel.swift
//  waither
//
//  Created by 최승희 on 2023/01/23.
//

import UIKit

open class CustomLabel: UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
            didSet {
                let attributedString = NSMutableAttributedString(string: self.text!)
                attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
                self.attributedText = attributedString
            }

        }
}
