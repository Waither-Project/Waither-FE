//
//  tempPWViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/22.
//

import UIKit

class TempPasswordViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailBottomLine: UIView!
    
    @IBOutlet weak var tempPasswordButton: UIButton!
    
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var emailValidLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.addCharacterSpacing()
        
        descrLabel.text = "웨이더에 가입하셨던 이메일을 입력해주세요. \n" + "임시 비밀번호를 보내드릴게요."
        descrLabel.addCharacterSpacing()
        
        tempPasswordButton.addTextSpacing(-1)
        tempPasswordButton.layer.cornerRadius = 25
        
        //text field 입력 감지
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        
        alertIcon.isHidden = true
        emailValidLabel.isHidden = true
        
        //키보드 내리기 
        emailTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)

        
    }
    //텍스트 입력 감지 함수
    @objc func emailTextFieldDidChange(textField: UITextField){
        if isFilled() == true {
            emailBottomLine.backgroundColor = UIColor.main_blue
        } else {
            emailBottomLine.backgroundColor = UIColor.none_gray
            tempPasswordButton.backgroundColor = UIColor.none_gray
        }
        
        guard let email = emailTextField.text, !email.isEmpty else { return }
        
        if isValidEmail(testStr: email) == false {
            alertIcon.isHidden = false
            emailValidLabel.isHidden = false
            emailBottomLine.backgroundColor = UIColor.alert_red
            tempPasswordButton.backgroundColor = UIColor.none_gray
        } else {
            alertIcon.isHidden = true
            emailValidLabel.isHidden = true
            emailBottomLine.backgroundColor = UIColor.main_blue
            tempPasswordButton.backgroundColor = UIColor.main_blue
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
