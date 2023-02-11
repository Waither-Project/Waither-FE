//
//  PasswordViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/08.
//

import UIKit
import Alamofire

class PasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var seeButton: UIButton!
    @IBOutlet weak var seeBtn: UIButton!
    @IBOutlet weak var nowPW: UITextField!
    @IBOutlet weak var changePW: UITextField!
    @IBOutlet weak var PWToChange: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var firstBarView: UIView!
    @IBOutlet var secondBarView: UIView!
    @IBOutlet var thirdBarView: UIView!
    
    @IBAction func clickButton(_ sender: UIButton) {
        if changePW.isSecureTextEntry == true {
            changePW.isSecureTextEntry = false
            seeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            changePW.isSecureTextEntry = true
            seeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @IBAction func clickBtn(_ sender: UIButton) {
        if PWToChange.isSecureTextEntry == true {
            PWToChange.isSecureTextEntry = false
            seeBtn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            PWToChange.isSecureTextEntry = true
            seeBtn.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    // 두 텍스트 필드 문자가 같은 지 확인
    func isSameBothTextField(_ first: UITextField,_ second: UITextField) -> Bool {
        if(first.text == second.text) {
            return true
        } else {
            return false
        }
    }
   
    // 텍스트 필드 입력값 변하면 유효성 검사
    @objc func TFdidChanged(_ sender: UITextField) {
        print("텍스트 변경 감지")
        print("text :", sender.text as Any)
        
        if (self.changePW.text!.count >= 7) {
            secondBarView.backgroundColor = .buttonColor
            let attributedString = NSMutableAttributedString(string: "")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.buttonColor)
            imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            attributedString.append(NSAttributedString(string: " 사용할 수 있는 비밀번호에요."))
            limitLabel.attributedText = attributedString
            limitLabel.sizeToFit()
            limitLabel.textColor = .buttonColor
        } else {
            secondBarView.backgroundColor = .warningLabelColor
            let attributedString = NSMutableAttributedString(string: "")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "exclamationmark.circle.fill")?.withTintColor(.warningLabelColor)
            imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            attributedString.append(NSAttributedString(string: " 비밀번호는 7자 이상이어야 해요."))
            limitLabel.attributedText = attributedString
            limitLabel.sizeToFit()
            limitLabel.textColor = .warningLabelColor
        }
        
        
        // 비밀번호가 일치한 경우, 일치하지 않은 경우 안내문 띄우기
        if !(self.changePW.text?.isEmpty ?? true) && !(self.PWToChange.text?.isEmpty ?? true) && isSameBothTextField(changePW, PWToChange) {
            secondBarView.backgroundColor = .buttonColor
            thirdBarView.backgroundColor = .buttonColor
            
            let attributedString = NSMutableAttributedString(string: "")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.buttonColor)
            imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            attributedString.append(NSAttributedString(string: " 사용할 수 있는 비밀번호에요."))
            warningLabel.attributedText = attributedString
            warningLabel.sizeToFit()
            warningLabel.textColor = .buttonColor
        } else if !(self.changePW.text?.isEmpty ?? true) && !(self.PWToChange.text?.isEmpty ?? true) && !isSameBothTextField(changePW, PWToChange) {
            secondBarView.backgroundColor = .buttonColor
            thirdBarView.backgroundColor = .warningLabelColor
            
            let attributedString = NSMutableAttributedString(string: "")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "exclamationmark.circle.fill")?.withTintColor(.warningLabelColor)
            imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            attributedString.append(NSAttributedString(string: " 비밀번호가 일치하지 않아요."))
            warningLabel.attributedText = attributedString
            warningLabel.sizeToFit()
            warningLabel.textColor = .warningLabelColor
        }
    
        // 텍스트 필드 3개 모두 채워졌는지, 비밀번호가 일치하는 지 확인
        if !(self.nowPW.text?.isEmpty ?? true)
            && !(self.changePW.text?.isEmpty ?? true) && isSameBothTextField(changePW, PWToChange) {
            updateNextButton(willActive: true)
        } else {
            updateNextButton(willActive: false)
        }
    }
    
    // '재설정' 버튼 활성화/비활성화
    func updateNextButton(willActive: Bool) {
        if(willActive == true) {
            // 다음 버튼 색 변경
            self.resetButton.backgroundColor = .buttonColor
            // 다음 페이지 연결
            print("다음 버튼 활성화")
        } else {
            self.resetButton.backgroundColor = .disabledButtonColor
            print("다음 버튼 비활성화")
        }
    }
    
    // 화면 터치시 키보드 내리기
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // 키보드 내리면서 동작
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        nowPW.delegate = self
        changePW.delegate = self
        PWToChange.delegate = self
        
        // 텍스트 필드 입력값 변경 감지
        //nowPW.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
        changePW.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
        PWToChange.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
        
        self.navigationController?.navigationBar.tintColor = .black
    }
}
