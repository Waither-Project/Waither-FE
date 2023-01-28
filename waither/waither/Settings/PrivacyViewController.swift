//
//  PrivacyViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/04.
//

import UIKit

class PrivacyViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ChangeButton: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var BarView: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBAction func LogoutButton(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let popUp = storyboard.instantiateViewController(withIdentifier: "logoutVC")
        popUp.modalPresentationStyle = .overFullScreen
        popUp.modalTransitionStyle = .crossDissolve
        
        self.present(popUp, animated: true, completion: nil)
         
    }
    
    @IBAction func UnresiButton(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let popUp = storyboard.instantiateViewController(withIdentifier: "unresiVC")
        popUp.modalPresentationStyle = .overFullScreen
        popUp.modalTransitionStyle = .crossDissolve
        
        self.present(popUp, animated: true, completion: nil)
         
    }
    
    @IBAction func ChangeBtnAction(_ sender: UIButton) {
        if ChangeButton == sender {
            ChangeButton.isSelected = true
            ChangeButton.setTitle("완료", for: .normal)
            BarView.backgroundColor = .buttonColor
            NameTextField.isHidden = false
            NameTextField.isEnabled = true
            NameTextField.tintColor = UIColor.clear
            
        } else {
            ChangeButton.isSelected = false
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        
        // 최대 글자수 이상을 입력한 이후에는 중간에 다른 글자를 추가할 수 없게끔 작동
        if text.count >= maxLength && range.length == 0 && range.location < maxLength {
            return false
        }
        return true
    }
    
    // MARK: - UITextFieldTextDidChange
    private let maxLength = 10
    
    @objc private func textDidChange(_ notification: Notification) {
        
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                
                if text.count > maxLength {
                    // 10글자 넘어가면 자동으로 키보드 내려감
                    textField.resignFirstResponder()
                }
                
                // 초과되는 텍스트 제거
                if text.count >= maxLength {
                    let index = text.index(text.startIndex, offsetBy: maxLength)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                }
                
                else if text.count > 7 {
                    
                    let attributedString = NSMutableAttributedString(string: "")
                    let imageAttachment = NSTextAttachment()
                    imageAttachment.image = UIImage(systemName: "exclamationmark.circle.fill")?.withTintColor(.warningLabelColor)
                    imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
                    attributedString.append(NSAttributedString(attachment: imageAttachment))
                    attributedString.append(NSAttributedString(string: " 성함은 1~7자 사이어야 해요."))
                    warningLabel.attributedText = attributedString
                    warningLabel.sizeToFit()
                    ChangeButton.isEnabled = false
                    warningLabel.textColor = .warningLabelColor
                    BarView.backgroundColor = .warningLabelColor
                    
                }
                
                else if text.count >= 1 && text.count <= 7 {
                    
                    let attributedString = NSMutableAttributedString(string: "")
                    let imageAttachment = NSTextAttachment()
                    imageAttachment.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.buttonColor)
                    imageAttachment.bounds = CGRect(x: -1.5, y: -1.5, width: 12, height: 12)
                    attributedString.append(NSAttributedString(attachment: imageAttachment))
                    attributedString.append(NSAttributedString(string: " 성함을 사용할 수 있어요."))
                    warningLabel.attributedText = attributedString
                    warningLabel.sizeToFit()
                    ChangeButton.isEnabled = true
                    ChangeButton.setTitleColor(.buttonColor, for: .selected)
                    warningLabel.textColor = .buttonColor
                    BarView.backgroundColor = .buttonColor
                }
            
            }
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
        NameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: NameTextField)
        
        //view.isOpaque = false
        self.navigationController?.navigationBar.tintColor = .black
    }
}
