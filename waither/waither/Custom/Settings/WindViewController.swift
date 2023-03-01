//
//  WindViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/12.
//

import UIKit
import VerticalSlider

class WindViewController: UIViewController {

    @IBOutlet weak var switch9: UISwitch!
    @IBOutlet var verticalSlider: VerticalSlider!
    @IBOutlet weak var windvaluelabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var alarmLabel: UILabel!
    
    var nickname : String = ""
    var windData : WindAlarmModel!
    var nameData : UserModel!
    
    @objc func sliderChanged() {
        windvaluelabel.text = String(Int(verticalSlider.value))
        //UserDefaults.standard.set(windvaluelabel.text, forKey: "wind")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let wind = UserDefaults.standard.string(forKey: "wind") {
            windvaluelabel.text = wind
            verticalSlider.value = Float(wind)!
           }
        */
        WindAlarmDataManager().windalarmDataManager(self)
        WindAlarmDataManager().nameDataManager(self)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo Bold", size: 15)!, .foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        switch9.transform = CGAffineTransformMakeScale(0.75, 0.75);
        
        verticalSlider.slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        // 그림자처리
        self.backgroundView.layer.shadowColor = UIColor.black.cgColor
        self.backgroundView.layer.masksToBounds = false
        self.backgroundView.layer.shadowOffset = CGSize(width: 4, height: 0)
        self.backgroundView.layer.shadowRadius = 5
        self.backgroundView.layer.shadowOpacity = 0.3
    }
}

extension WindViewController {
    // MARK: 사용자 바람 세기 설정 조회 API success
    func WindAlarmSuccessAPI(_ result : WindAlarmModel) {
        self.windData = result
    
        windvaluelabel.text = String(windData.windValue)
        verticalSlider.value = Float(windData.windValue)
        
        if windData.windAlarm == "Y" {
            switch9.isOn = true
        }
        else { switch9.isOn = false }
    }
    
    // OO님이~ 부분 사용자 이름 데이터 넣어주기
    func NameSuccessAPI(_ result : UserModel) {
        self.nameData = result
        nickname = nameData.name
        alarmLabel.text = nickname + "님이 설정한 바람 세기를 넘으면 알려드릴게요!"
        userLabel.text = nickname + "님이 설정한 바람 세기"
    }
}
