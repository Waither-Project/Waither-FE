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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginLabel.addCharacterSpacing()
        
//        loginByEmailLabel.addTextSpacing(-1)
//        loginByEmailLabel.titleLabel?.font =
        
        signinByEmailBtn.layer.borderWidth = 1
        signinByEmailBtn.layer.borderColor = UIColor.main_blue?.cgColor
        signinByEmailBtn.layer.cornerRadius = 20
    }
    
    @IBAction func loginByEmailBtnClicked(_ sender: Any) {
        guard let loginByEmailVC = self.storyboard?.instantiateViewController(identifier: "LoginByEmailViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(loginByEmailVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor{
    static let main_blue = UIColor(named: "Splash_blue")
    static let none_gray = UIColor(named: "Gray")
}

extension UIButton{

    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }

}



