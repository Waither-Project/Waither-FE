//
//  LoginByEmailViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/15.
//

import UIKit

class LoginByEmailViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var idBottomLine: UIView!
    
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwBottomLine: UIView!
    
    @IBOutlet weak var onOffButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var lostPwLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginLabel.addCharacterSpacing()
        lostPwLabel.addTextSpacing(-1)
        loginButton.addTextSpacing(-1)
        
        loginButton.layer.cornerRadius = 25
        
        onOffButton.layer.isHidden = true
        
        pwTextField.isSecureTextEntry = true

        // 키보드 내리기
        idTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        pwTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        loginButton.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        
        //text field 입력 감지
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        
        //text field 입력 감지
        pwTextField.addTarget(self, action: #selector(pwTextFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        
        
    }
    @IBAction func lostPasswordButtonClicked(_ sender: Any) {
        guard let tempPasswordVC = self.storyboard?.instantiateViewController(identifier: "TempPasswordViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(tempPasswordVC, animated: true)
    }
    @IBAction func onOffBtnClicked(_ sender: Any) {
        if pwTextField.isSecureTextEntry == true {
            pwTextField.isSecureTextEntry = false
            onOffButton.configuration?.background.image = UIImage(named: "ic-eye.fill-unvisible")
        } else {
            pwTextField.isSecureTextEntry = true
            onOffButton.configuration?.background.image = UIImage(named: "ic-eye.fill-visible")
        }
    }
    
    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        if idTextField.isFirstResponder {
            pwTextField.becomeFirstResponder()
        }
    }
    
    //텍스트 입력 감지 함수
    @objc func idTextFieldDidChange(textField: UITextField){
        if idTextField.text?.isEmpty == true{
            idBottomLine.tintColor = UIColor.none_gray
        } else {
            idBottomLine.backgroundColor = UIColor.main_blue
            
            
        }
        isFilled()
    }
    
    //텍스트 입력 감지 함수
    @objc func pwTextFieldDidChange(textField: UITextField){
        if pwTextField.text?.isEmpty == true{
            pwBottomLine.backgroundColor = UIColor.none_gray
            onOffButton.layer.isHidden = true
        } else {
            pwBottomLine.backgroundColor = UIColor.main_blue
            onOffButton.layer.isHidden = false
            
            
        }
        isFilled()
    }
    
    //둘 다 입력 되었는지
    func isFilled(){
        if idTextField.text?.isEmpty == true || pwTextField.text?.isEmpty == true {
            if idTextField.text?.isEmpty == true {
                idBottomLine.backgroundColor = UIColor.none_gray
                loginButton.backgroundColor = UIColor.none_gray
            } else {
                pwBottomLine.backgroundColor = UIColor.none_gray
                loginButton.backgroundColor = UIColor.none_gray
            }
            loginButton.backgroundColor = UIColor.none_gray
        } else {
            loginButton.backgroundColor = UIColor.main_blue
        }
    }

}

