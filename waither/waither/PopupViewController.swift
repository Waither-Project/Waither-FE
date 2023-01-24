//
//  PopupViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/09.
//

import UIKit

extension UILabel {
    func addCharacterSpacing(_ value: Double = -0.1) {
        let kernValue = self.font.pointSize * CGFloat(value)
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}

extension NSMutableAttributedString {
    func ENGbold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont(name: "SF Pro Bold", size: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font!]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    func regular(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont(name: "Apple SD Gothic Neo Medium", size: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font!]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont(name: "Apple SD Gothic Neo Bold", size: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font!]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}

class PopupViewController: UIViewController {
    
    @IBOutlet weak var resignLabel: UILabel!
    @IBOutlet weak var logoutLabel: UILabel!
    
    @IBAction func donebtn(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let popUp = storyboard.instantiateViewController(withIdentifier: "resignVC")
        popUp.modalPresentationStyle = .overFullScreen
        popUp.modalTransitionStyle = .crossDissolve
        
        self.present(popUp, animated: true, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in popUp.dismiss(animated: true, completion: nil)} )
    }
    
    @IBAction func Donebtn(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let popUp = storyboard.instantiateViewController(withIdentifier: "doneVC")
        popUp.modalPresentationStyle = .overFullScreen
        popUp.modalTransitionStyle = .crossDissolve
        
        self.present(popUp, animated: true, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in popUp.dismiss(animated: true, completion: nil)} )
    }
    
    @IBAction func closePopupBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil) // 사라지게 하기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutLabel?.attributedText = NSMutableAttributedString()
            .regular(string: "지금 로그아웃하시면\n", fontSize: 15)
            .bold(string: "사용자 데이터를 저장할 수 없어요.\n", fontSize: 15)
            .regular(string: "그래도 로그아웃해 드릴까요?", fontSize: 15)
        
        resignLabel?.attributedText = NSMutableAttributedString()
            .regular(string: "탈퇴하면 ", fontSize: 18)
            .bold(string: "데이터를\n다시 복구할 수 없어요.\n", fontSize: 18)
            .regular(string: "그래도 진행할까요?", fontSize: 18)
    }

}
