//
//  LoginViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/15.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginByEmailLabel: UIButton!
    
    @IBOutlet weak var signinByEmailBtn: UIButton!
    
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    @IBOutlet weak var withoutLoginLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginLabel.addCharacterSpacing()

        loginByEmailLabel.addTextSpacing(-1)
        withoutLoginLabel.addTextSpacing(-1)
        signinByEmailBtn.addTextSpacing(-1)
        
        
        signinByEmailBtn.layer.borderWidth = 1
        signinByEmailBtn.layer.borderColor = UIColor.main_blue?.cgColor
        signinByEmailBtn.layer.cornerRadius = 4
        
        kakaoLoginBtn.layer.cornerRadius = 4
        appleLoginBtn.layer.cornerRadius = 4
        
        withoutLoginLabel.addTarget(self, action: #selector(goAlert), for: .touchUpInside)
        

        kakaoLoginBtn.setImage(UIImage(named: "Kakao_logo"), for: .normal)
        kakaoLoginBtn.imageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func signupBtnClicked(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    @IBAction func loginByEmailBtnClicked(_ sender: Any) {
        guard let loginByEmailVC = self.storyboard?.instantiateViewController(identifier: "LoginByEmailViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(loginByEmailVC, animated: true)
    }
    
    
    @objc func goAlert(){
            let alert = self.storyboard?.instantiateViewController(withIdentifier: "LoginPopupViewController") as! LoginPopupViewController
            alert.modalPresentationStyle = .overCurrentContext
            present(alert, animated: false, completion: nil)
        }
    

}



extension UIColor{
    static let main_blue = UIColor(named: "Splash_blue")
    static let none_gray = UIColor(named: "Gray")
    static let alert_red = UIColor(named: "waither_red")
}

extension UIButton{

    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }

}



