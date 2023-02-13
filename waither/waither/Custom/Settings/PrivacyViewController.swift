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
    @IBOutlet weak var emailLabel: UILabel!
    
    var userData : UserModel!
    
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
            NameTextField.isEnabled = true
            NameTextField.tintColor = UIColor.clear
            // text field에서 이름 가져와서 post 보내주기
            postName(nickname: self.NameTextField.text!)
            
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
    
        UserDataManager().userDataManager(self)
        
        hideKeyboardWhenTappedAround()
        NameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: NameTextField)
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func postName(nickname: String) {
        // MARK: 회원 이름 변경 API success
        let nickname = nickname
    
        let body = ["name" : nickname]
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: [])
        
        let url = URL(string: "https://www.waither.shop/users/settings/user?userIdx=1")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let e = error {
                print("An error has occured: \(e.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                do{
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    let status = jsonObject["isSuccess"] as? Bool
                    let msg = jsonObject["message"] as? String
                    
                    if status! {
                        print(msg!)
                    }
                    
                } catch let e as NSError{
                    print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                }
            }
        }
        // POST 전송
        task.resume()
    }
}

extension PrivacyViewController {
    // MARK: 회원 정보 조회 API success
    func UserSuccessAPI(_ result : UserModel) {
        self.userData = result
        guard (emailLabel.text = userData.email) != nil else {return}
        guard (NameTextField.text = userData.name) != nil else {return}
    }
}
