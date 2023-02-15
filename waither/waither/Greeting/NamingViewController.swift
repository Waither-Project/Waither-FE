//
//  NamingViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/08.
//

import UIKit

class NamingViewController: UIViewController{
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameBottomLine: UIView!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explainLabel.text = "제가 뭐라고 부르면 될까요?"
        explainLabel.addCharacterSpacing()
        alertLabel.addCharacterSpacing()
        
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(textField:)),
                                for: UIControl.Event.editingChanged)
        nameTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        alertIcon.isHidden = true
        alertLabel.isHidden = true
    
        
        
    }
    @IBAction func okButtonClicked(_ sender: Any) {
        //text field에서 이름 가져와서 post 보내주기
        if(okBtn.configuration?.background.backgroundColor == UIColor.main_blue){
            postName(nickname: self.nameTextField.text!)
        }
        
    }
    
    @objc func dismissView(){
            dismiss(animated: false, completion: nil)
        }
    
    func postName(nickname: String) {
        
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
                                
                                let Survey = UIStoryboard.init(name: "SurveyLaunchScreen", bundle: nil)
                                guard let pvc = self.presentingViewController else { return }
                                self.dismiss(animated: false) {
                                    let nextVC = Survey.instantiateViewController(withIdentifier: "SurveyLaunchScreenViewController") as! SurveyLaunchScreenViewController
                                    let navController = UINavigationController(rootViewController: nextVC)
                                    navController.modalTransitionStyle = .coverVertical
                                    navController.modalPresentationStyle = .fullScreen
                                    pvc.present(navController, animated:true, completion: nil)
                                }
                            }
                            
                        }catch let e as NSError{
                            
                            print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                            
                        }
                    }
                }
        // POST 전송
        task.resume()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.hidesBackButton = true
    }
    
    @objc func nameTextFieldDidChange(textField: UITextField){
        nameBottomLine.backgroundColor = UIColor.main_blue
        isfilled()
    }
    @objc func didEndOnExit(_ sender: UITextField) {
        
    }
    func isfilled(){
        let res = isValid()
        if nameTextField.text?.isEmpty == true{
            okBtn.configuration?.background.backgroundColor = UIColor.none_gray
            nameBottomLine.backgroundColor = UIColor.red
        }else if res == false{
            okBtn.configuration?.background.backgroundColor = UIColor.none_gray
            nameBottomLine.backgroundColor = UIColor.red
        }else {
            okBtn.configuration?.background.backgroundColor = UIColor.main_blue
            nameBottomLine.backgroundColor = UIColor.main_blue
        }
    }
    
    func isValid() -> Bool{
        //validation
        if nameTextField.text!.count > 6 || nameTextField.text!.count < 1{
            alertIcon.isHidden = false
            alertLabel.isHidden = false
            return false
        }else{
            alertIcon.isHidden = true
            alertLabel.isHidden = true
            nameBottomLine.backgroundColor = UIColor.main_blue
        }
        
        return true
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

}
