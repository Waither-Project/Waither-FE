//
//  Survey3ViewController.swift
//  waither
//
//  Created by 최다경 on 2023/02/15.
//

import UIKit

class Survey3ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "날씨 알림을 받으실\n시간대를 설정해주세요."
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 28)
        let font = UIFont.boldSystemFont(ofSize: 28)

        guard let text = self.label.text else { return }
        let attributedStr = NSMutableAttributedString(string: label.text!)

        attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "날씨 알림"))
        attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "시간대"))
        
        label.attributedText = attributedStr
        
        datePicker.subviews[0].subviews[1].backgroundColor = UIColor(named: "pickerColor")
    }
    
    @IBAction func checkBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "SaveViewController") as? SaveViewController else {return}
        
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
        //self.presentingViewController?.dismiss(animated: true)
    }
}
