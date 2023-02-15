//
//  SurveyLaunchScreenViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/02/16.
//

import UIKit

class SurveyLaunchScreenViewController: UIViewController {

    @IBOutlet weak var greetingView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var nameData : UserModel!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SurveyDataManager().nameDataManager(self)
        
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
                greetingView.addGestureRecognizer(gesture)
    }

    @objc func tapped(_ gesture: UITapGestureRecognizer) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Survey", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "Survey1ViewController")
        viewcontroller.modalPresentationStyle = .fullScreen
        present(viewcontroller, animated: true, completion: nil)
    }
}

extension SurveyLaunchScreenViewController {
    func NameSuccessAPI(_ result : UserModel) {
        self.nameData = result
        name = nameData.name
        
        label1.text = "반가워요 " + name + "님!"
        label2.text = "조금 더 정확한 기상예보를 위해\n" + name + "님이 느낀 어제 날씨가 궁금해요."
        
        label2.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        let font = UIFont.boldSystemFont(ofSize: 20)
        guard let text = self.label2.text else { return }
        let attributedStr = NSMutableAttributedString(string: label2.text!)
        attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "정확한 기상예보"))
        attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "어제 날씨"))
        label2.attributedText = attributedStr
    }
}
