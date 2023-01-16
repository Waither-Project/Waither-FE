//
//  GreetingViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/07.
//

import UIKit



class GreetingViewController: UIViewController {
    @IBOutlet weak var greetingMsg: UILabel!
    @IBOutlet var greetingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greeting = "안녕하세요." + "\n저는 당신의 가상 비서" + "\n웨이더에요!"
        
        let style = NSMutableParagraphStyle()
        let fontSize: CGFloat = 26
        let lineheight = fontSize * 1.35  //font size * multiple
        style.minimumLineHeight = lineheight
        style.maximumLineHeight = lineheight
        style.alignment = .center
        
        
    
        greetingMsg.attributedText = NSAttributedString(
          string: greeting,
          attributes: [
            .paragraphStyle: style,
                .baselineOffset: (lineheight - fontSize) / 4
          ])
        greetingMsg.addCharacterSpacing()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

                // 2. add the gesture recognizer to a view
                greetingView.addGestureRecognizer(tapGesture)
            }

            // 3. this method is called when a tap is recognized
            @objc func handleTap(sender: UITapGestureRecognizer) {
                print("tap")
                guard let namingVC = self.storyboard?.instantiateViewController(identifier: "NamingViewController") as? NamingViewController else { return }
                    self.navigationController?.pushViewController(namingVC, animated: true)

                
                greetingMsg.attributedText = NSMutableAttributedString()
                        .bold(string: "가상 비서", fontSize: 26)
    }
    
    
    
}
open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
}
extension UILabel {
    func addCharacterSpacing(kernValue:Double = -1.0) {
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}

extension NSMutableAttributedString {

    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}

