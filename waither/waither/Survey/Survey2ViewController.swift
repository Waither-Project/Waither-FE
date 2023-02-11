//
//  SurveyViewController.swift
//  Waither_UI
//
//  Created by 최다경 on 2023/01/04.
//

import UIKit

class Survey2ViewController: UIViewController{
    
    
    var str: String = ""
    let cnt = 1
    let max = 12
    var sortCode = 0
    
    @IBOutlet weak var pickerTime: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var amBtn: UIButton!
    @IBOutlet weak var pmBtn: UIButton!
    

    var timeFlag = true //true: am, false: pm
    
    let times = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let clr = UIColor(named: "buttonColor")
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = str
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
        let font = UIFont.boldSystemFont(ofSize: 25)

        guard let text = self.label.text else { return }
        let attributedStr = NSMutableAttributedString(string: label.text!)
        
        switch sortCode {
        case 1:
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "추웠다고"))
        case 2:
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "조금 추웠다고"))
        case 3:
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "딱 좋았다고"))
        case 4:
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "조금 더웠다고"))
        case 5:
            attributedStr.addAttribute(.font, value: font, range: (text as NSString).range(of: "더웠다고"))
        default:
            print("default")
        }
        

        label.attributedText = attributedStr
        pmBtn.tintColor = UIColor.systemGray3
        amBtn.tintColor = clr
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
            selectedPickerViewUICustom()
        }
    func selectedPickerViewUICustom() {
            pickerTime.subviews[1].backgroundColor = .clear
            
            let upLine = UIView(frame: CGRect(x: -10, y: 8, width: 150, height: 0.8))
            let underLine = UIView(frame: CGRect(x: -10, y: 40, width: 150, height: 0.8))
            
            upLine.backgroundColor = UIColor(red: 0.365, green: 0.557, blue: 0.847, alpha: 1)
            underLine.backgroundColor = UIColor(red: 0.365, green: 0.557, blue: 0.847, alpha: 1)
            
           pickerTime.subviews[1].addSubview(underLine)
        pickerTime.subviews[1].addSubview(upLine)
        }
    
    @IBAction func checkBtnPrsd(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "SaveViewController") as? SaveViewController else {return}
        
        newVC.modalTransitionStyle = .coverVertical
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
        //self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func dontKnowBtnPrsd(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func amBtnPrsd(_ sender: UIButton) {
        print(timeFlag)
        print("am prsd")
        
        if (timeFlag){
            amBtn.tintColor = clr
            pmBtn.tintColor = UIColor.systemGray3
        }else{
            timeFlag = true
            amBtn.tintColor = clr
            pmBtn.tintColor = UIColor.systemGray3
        }
        
    }

    @IBAction func pmBtnPrsd(_ sender: UIButton) {
        if (timeFlag){
            timeFlag = false
            
            amBtn.tintColor = UIColor.systemGray3
            pmBtn.tintColor = clr
        }else{
            amBtn.tintColor = UIColor.systemGray3
            pmBtn.tintColor = clr
        }
    }
    
}

extension Survey2ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 30))

            let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
            timeLabel.layer.masksToBounds = true
        
            timeLabel.text = times[row]
            timeLabel.textAlignment = .center
            //timeLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
            timeLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
            timeLabel.font = UIFont.boldSystemFont(ofSize: 20)
            view.addSubview(timeLabel)
            
           
            return view
        }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
 
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
    }
    
    
    
    
}



extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
