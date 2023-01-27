//
//  UserDataViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/18.
//

import UIKit
import CircularSlider

class UserDataViewController: UIViewController {
 
    @IBOutlet weak var circularslider: CircularSlider!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureLabels: UILabel!
    @IBOutlet weak var vhotbtn: UIButton!
    @IBOutlet weak var hotbtn: UIButton!
    @IBOutlet weak var goodbtn: UIButton!
    @IBOutlet weak var coldbtn: UIButton!
    @IBOutlet weak var vcoldbtn: UIButton!
    @IBOutlet weak var savebtn: UIBarButtonItem!
    @IBOutlet weak var minusImage: UIImageView!
    
    @IBAction func clicksaveBtn(_ sender: UIBarButtonItem) {
        print(circularslider.textfield.text! + "℃")
    }
    
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        for btn in BtnArray {
            if btn == sender {
                btn.isSelected = true
                btn.backgroundColor = .buttonColor
                //circularslider.textfield.text = "0"
            } else {
                btn.isSelected = false
                btn.backgroundColor = .white
            }
            
            if btn.isSelected == true {
                guard let wheather = btn.titleLabel?.text else { return }
                
                print(wheather)
                self.savebtn.isEnabled = true
                self.savebtn.tintColor = .buttonColor
                
                Label.attributedText = NSMutableAttributedString().ENGbold(string: "Waither", fontSize: 18)
                    .regular(string: "의 유저분들이 \n", fontSize: 18)
                    .bold(string: "가장 많이 선택한 ", fontSize: 18)
                    .regular(string: "'", fontSize: 18)
                    .regular(string: wheather, fontSize: 18)
                    .regular(string: "' 온도", fontSize: 18)
                
                let say: String = "고 느끼는 온도를 나타내요.\n 이 데이터를 기반으로 제가 날씨를 판단해드릴게요."
                let nickname: String = "OO"
                var percent: Int = 10
                
                if vhotbtn == sender {
                    nameLabel.attributedText = NSMutableAttributedString().regular(string: nickname, fontSize: 12)
                        .regular(string: "님이 ", fontSize: 12)
                        .bold(string: feel[0], fontSize: 12)
                        .regular(string: say, fontSize: 12)
                    minusImage.isHidden = true
                    percent = 50
                    percentLabel.text = "약" + " \(percent)" + "%의 유저가 해당 온도를 \n 선택했습니다."
                } else if hotbtn == sender {
                    nameLabel.attributedText = NSMutableAttributedString().regular(string: nickname, fontSize: 12)
                        .regular(string: "님이 ", fontSize: 12)
                        .bold(string: feel[1], fontSize: 12)
                        .regular(string: say, fontSize: 12)
                    minusImage.isHidden = true
                    percent = 60
                    percentLabel.text = "약" + " \(percent)" + "%의 유저가 해당 온도를 \n 선택했습니다."
                } else if goodbtn == sender {
                    nameLabel.attributedText = NSMutableAttributedString().regular(string: nickname, fontSize: 12)
                        .regular(string: "님이 ", fontSize: 12)
                        .bold(string: feel[2], fontSize: 12)
                        .regular(string: say, fontSize: 12)
                    minusImage.isHidden = true
                    percent = 70
                    percentLabel.text = "약" + " \(percent)" + "%의 유저가 해당 온도를 \n 선택했습니다."
                } else if coldbtn == sender {
                    nameLabel.attributedText = NSMutableAttributedString().regular(string: nickname, fontSize: 12)
                        .regular(string: "님이 ", fontSize: 12)
                        .bold(string: feel[3], fontSize: 12)
                        .regular(string: say, fontSize: 12)
                    minusImage.isHidden = false
                    percent = 80
                    percentLabel.text = "약" + " \(percent)" + "%의 유저가 해당 온도를 \n 선택했습니다."
                } else {
                    nameLabel.attributedText = NSMutableAttributedString().regular(string: nickname, fontSize: 12)
                        .regular(string: "님이 ", fontSize: 12)
                        .bold(string: feel[4], fontSize: 12)
                        .regular(string: say, fontSize: 12)
                    minusImage.isHidden = false
                    percent = 90
                    percentLabel.text = "약" + " \(percent)" + "%의 유저가 해당 온도를 \n 선택했습니다."
                }
            }
        }
    }
    
    var feel : [String] = ["매우 덥다","덥다","좋다","춥다","매우 춥다"]
    
    var BtnArray = [UIButton]()
    
    /*
    @objc func textFieldDidChange(_ sender: Any?) {
        let first = circularslider.textfield.text?[circularslider.textfield.text!.startIndex]
        let firsts : String = String(first!)
        let second = circularslider.textfield.text?[circularslider.textfield.text!.index(before: circularslider.textfield.text!.endIndex)]
        self.temperatureLabel?.text = firsts
        self.temperatureLabels?.text = String(second!)
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        BtnArray.append(vhotbtn)
        BtnArray.append(hotbtn)
        BtnArray.append(goodbtn)
        BtnArray.append(coldbtn)
        BtnArray.append(vcoldbtn)
        
        for btn in BtnArray {
            btn.layer.borderWidth = 1
            btn.layer.cornerRadius = 15
            btn.layer.borderColor = UIColor.buttonColor.cgColor
        }
      
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        self.navigationController?.navigationBar.tintColor = .black
        
        //circularslider.textfield.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .allEvents)
    }
}
