//
//  SignupViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/21.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailBottomLine: UIView!
    
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var emailValidLabel: UILabel!
    
    @IBOutlet weak var duplicatedButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signupLabel.addCharacterSpacing()
        signupButton.addTextSpacing(-1)
        signupButton.layer.cornerRadius = 25
        
        duplicatedButton.addTextSpacing(-1)
        duplicatedButton.layer.cornerRadius = 13
        
        //text field 입력 감지
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        
        alertIcon.isHidden = true
        emailValidLabel.isHidden = true
        
        emailTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }

    //텍스트 입력 감지 함수
    @objc func emailTextFieldDidChange(textField: UITextField){
        if isFilled() == true {
            emailBottomLine.backgroundColor = UIColor.main_blue
        } else {
            emailBottomLine.backgroundColor = UIColor.none_gray
            signupButton.backgroundColor = UIColor.none_gray
            duplicatedButton.backgroundColor = UIColor.none_gray
        }
        
        guard let email = emailTextField.text, !email.isEmpty else { return }
        
        if isValidEmail(testStr: email) == false {
            alertIcon.isHidden = false
            emailValidLabel.isHidden = false
            emailBottomLine.backgroundColor = UIColor.alert_red
            signupButton.backgroundColor = UIColor.none_gray
            duplicatedButton.backgroundColor = UIColor.none_gray
        } else {
            alertIcon.isHidden = true
            emailValidLabel.isHidden = true
            emailBottomLine.backgroundColor = UIColor.main_blue
            signupButton.backgroundColor = UIColor.main_blue
            duplicatedButton.backgroundColor = UIColor.main_blue
        }
        
        
    }
    
    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        emailTextField.resignFirstResponder()
    }
    
    // 이메일 형식 검사
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isFilled() -> Bool {
        if emailTextField.text?.isEmpty == true {
            return false
        } else {
            return true
        }
    }
    
}
