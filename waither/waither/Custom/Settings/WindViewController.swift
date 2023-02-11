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
    
    var nickname : String = "웨이더"
    var windData : WindAlarmModel!
    
    @objc func sliderChanged() {
        windvaluelabel.text = String(Int(verticalSlider.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WindAlarmDataManager().windalarmDataManager(self)
        
        alarmLabel.text = nickname + "님이 설정한 바람 세기를 넘으면 알려드릴게요!"
        userLabel.text = nickname + "님이 설정한 바람 세기"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo Bold", size: 15)!, .foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        switch9.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        
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
        print(windData.windValue)
        
        guard (windvaluelabel.text = String(windData.windValue)) != nil else {return}
        verticalSlider.value = Float(windData.windValue)
        
        if windData.windAlarm == "Y" {
            switch9.isOn = true
        }
        else { switch9.isOn = false }
    }
}
