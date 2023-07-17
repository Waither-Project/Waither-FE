//
//  ViewController.swift
//  Waither_UI
//
//  Created by 최다경 on 2023/01/04.
//

import UIKit

class Survey1ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var coldBtn: UIButton!
    @IBOutlet weak var littleColdBtn: UIButton!
    
    @IBOutlet weak var goodBtn: UIButton!
    @IBOutlet weak var littleHotBtn: UIButton!
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var dontKnowBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "어제 날씨는 \n어떠셨나요?"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
        let font = UIFont.boldSystemFont(ofSize: 25)

        guard let text = self.label.text else { return }
        let attributedStr = NSMutableAttributedString(string: label.text!)

        attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "어제 날씨"))
        label.attributedText = attributedStr
        
        coldBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
        littleColdBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
        goodBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
        littleHotBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
        hotBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
        dontKnowBtn.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo", size: 15)
    }

    @IBAction func coldBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "Survey2ViewController") as? Survey2ViewController else {return}
        newVC.str = "추웠다고 느낀 시간대가 언제인가요?"
        newVC.sortCode = 1
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: false, completion: nil)

    }
    
    @IBAction func littleColdBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "Survey2ViewController") as? Survey2ViewController else {return}
        newVC.str = "조금 추웠다고 느낀 시간대가 언제인가요?"
        newVC.sortCode = 2
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func goodBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "Survey2ViewController") as? Survey2ViewController else {return}
        newVC.str = "딱 좋았다고 느낀 시간대가 언제인가요?"
        newVC.sortCode = 3
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func littleHotBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "Survey2ViewController") as? Survey2ViewController else {return}
        newVC.str = "조금 더웠다고 느낀 시간대가 언제인가요?"
        newVC.sortCode = 4
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func hotBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "Survey2ViewController") as? Survey2ViewController else {return}
        newVC.str = "더웠다고 느낀 시간대가 언제인가요?"
        newVC.sortCode = 5
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func dontKnowBtnPrsd(_ sender: UIButton) {
        print("do nothing")
    }
}

