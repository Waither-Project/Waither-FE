//
//  LoginPopupViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/23.
//

import UIKit

class LoginPopupViewController: UIViewController {
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.layer.cornerRadius = 18
        
        
        alertLabel.text = "로그인을 하지 않으면 \n" + "데이터가 저장되지 않아요!"
        alertLabel.addCharacterSpacing()
        
        let attributedString = NSMutableAttributedString(string: alertLabel.text!, attributes: [
            .font: UIFont.fontWithName(type: .medium, size: 18),
                  .foregroundColor: UIColor(white: 0.0, alpha: 1.0),
                  .kern: -1
                 ])
                
        attributedString.addAttribute(.font, value: UIFont.fontWithName(type: .bold_2, size: 18), range: (alertLabel.text! as NSString).range(of: "데이터"))
        
        attributedString.addAttribute(.font, value: UIFont.fontWithName(type: .bold_2, size: 18), range: (alertLabel.text! as NSString).range(of: "저장되지 않아요!"))
                
        self.alertLabel.attributedText = attributedString
        
        cancelButton.addTextSpacing(-1)
        cancelButton.layer.cornerRadius = 23
        
        okButton.addTextSpacing(-1)
        okButton.layer.cornerRadius = 23
        
        cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        //okButton.addTarget

        
    }
    @IBAction func okButtonClicked(_ sender: Any) {
        
        let Greeting = UIStoryboard.init(name: "Greeting", bundle: nil)
        guard let pvc = self.presentingViewController else { return }
        self.dismiss(animated: false) {
            let nextVC = Greeting.instantiateViewController(withIdentifier: "GreetingViewController") as! GreetingViewController
            let navController = UINavigationController(rootViewController: nextVC)
            navController.modalTransitionStyle = .coverVertical
            navController.modalPresentationStyle = .fullScreen
            pvc.present(navController, animated:true, completion: nil)
        }
    }
    
    @objc func dismissView(){
            dismiss(animated: false, completion: nil)
        }

}
