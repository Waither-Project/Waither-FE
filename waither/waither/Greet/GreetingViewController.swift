//
//  GreetingViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/07.
//

import UIKit



class GreetingViewController: UIViewController {
    @IBOutlet weak var helloMsg: UILabel!
    @IBOutlet weak var greetingMsg: UILabel!
    @IBOutlet var greetingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingMsg.text = "저는 당신의 가상 비서" + "\n웨이더에요!"
        
        helloMsg.addCharacterSpacing()
        greetingMsg.addCharacterSpacing()
        
        let attributedString = NSMutableAttributedString(string: greetingMsg.text!, attributes: [
            .font: UIFont.fontWithName(type: .medium, size: 26),
                  .foregroundColor: UIColor(white: 0.0, alpha: 1.0),
                  .kern: -1
                 ])
                
        attributedString.addAttribute(.font, value: UIFont.fontWithName(type: .bold_2, size: 26), range: (greetingMsg.text! as NSString).range(of: "가상 비서"))
        
        attributedString.addAttribute(.font, value: UIFont.fontWithName(type: .bold_2, size: 26), range: (greetingMsg.text! as NSString).range(of: "웨이더"))
                
        self.greetingMsg.attributedText = attributedString
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

                // 2. add the gesture recognizer to a view
                greetingView.addGestureRecognizer(tapGesture)
            }

            // 3. this method is called when a tap is recognized
            @objc func handleTap(sender: UITapGestureRecognizer) {
                print("tap")
                guard let namingVC = self.storyboard?.instantiateViewController(identifier: "NamingViewController") as? NamingViewController else { return }
                    self.navigationController?.pushViewController(namingVC, animated: true)

    }
    
}


enum FontType {
    case regular_2, bold_2, medium, light, semibold
}

extension UIFont {
    static func fontWithName(type: FontType, size: CGFloat) -> UIFont {
        var fontName = ""
        switch type {
        case .regular_2:
            fontName = "AppleSDGothicNeo-Regular"
        case .light:
            fontName = "AppleSDGothicNeo-Light"
        case .medium:
            fontName = "AppleSDGothicNeo-Medium"
        case .semibold:
            fontName = "AppleSDGothicNeo-SemiBold"
        case .bold_2:
            fontName = "AppleSDGothicNeo-Bold"
        }
        
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
                                                         
                                                        


