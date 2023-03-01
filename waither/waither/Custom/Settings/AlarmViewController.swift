//
//  AlarmViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/08.
//

import UIKit

class AlarmViewController: UIViewController, SendDataDelegate{
    
    var alarmData : AlarmModel!
    var nameData : UserModel!
    
    func sendData(data: String) {
        alarmtimeLabel.text = data
        //UserDefaults.standard.set(data, forKey: "alarm")
    }

    @IBOutlet weak var SunButton: UIButton!
    @IBOutlet weak var MonButton: UIButton!
    @IBOutlet weak var TuesButton: UIButton!
    @IBOutlet weak var WedButton: UIButton!
    @IBOutlet weak var ThursButton: UIButton!
    @IBOutlet weak var FriButton: UIButton!
    @IBOutlet weak var SatButton: UIButton!
    
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch6: UISwitch!
    @IBOutlet weak var switch7: UISwitch!
    @IBOutlet weak var switch8: UISwitch!
    
    @IBOutlet weak var alarmtimeLabel: UILabel!
    var alarm : String = ""
    @IBOutlet weak var userLabel: UILabel!
    var nickname : String = ""
    
    @IBAction func TimeButton(_ sender: Any) {
        guard let popUp = self.storyboard?.instantiateViewController(withIdentifier: "timeVC") as? TimeViewController else { return }

        popUp.modalPresentationStyle = .overFullScreen
        popUp.modalTransitionStyle = .crossDissolve
        popUp.delegate = self
        
        self.present(popUp, animated: true)
    }
    
    // UIButton을 요소로 가지는 배열 선언
    var BtnArray = [UIButton]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo Bold", size: 15)!]
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let text = UserDefaults.standard.string(forKey: "alarm") {
            alarmtimeLabel.text = text
        }
        */
        AlarmDataManager().alarmDataManager(self)
        AlarmDataManager().nameDataManager(self)
        
        BtnArray.append(SunButton)
        BtnArray.append(MonButton)
        BtnArray.append(TuesButton)
        BtnArray.append(WedButton)
        BtnArray.append(ThursButton)
        BtnArray.append(FriButton)
        BtnArray.append(SatButton)
        
        for btn in BtnArray {
            btn.layer.borderWidth = 1
            btn.layer.cornerRadius = 20
            btn.layer.borderColor = UIColor.buttonColor.cgColor
        }
        
        switch4.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch5.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch6.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch7.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch8.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
    }
    
    @IBOutlet weak var DayLabel: UILabel!
    
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        DayLabel.text = "매주 "
        
        for btn in BtnArray {
            if btn == sender {
                // 만약 현재 버튼이 이 함수를 호출한 버튼이라면
                if(btn.isSelected == false)
                {
                    btn.isSelected = true
                    btn.backgroundColor = .buttonColor
                }
                else{
                    btn.isSelected = false
                    btn.backgroundColor = .white
                }
            }
            
            if btn.isSelected == true {
                guard let DayValue = btn.titleLabel?.text else { return }
                DayLabel.text! += DayValue + " "
            }
        }
    }
}

extension AlarmViewController {
    // MARK: 사용자 알람 설정 조회 API success
    func AlarmSuccessAPI(_ result : AlarmModel) {
        self.alarmData = result
        print(alarmData.outTime)
        
        alarmtimeLabel.text = alarmData.outTime
    
        if alarmData.outAlarm == "Y" {
            switch4.isOn = true
        }
        else { switch4.isOn = false }
        
        if alarmData.climateAlarm == "Y" {
            switch5.isOn = true
        }
        else { switch5.isOn = false }
        
        if alarmData.customAlarm == "Y" {
            switch6.isOn = true
        }
        else { switch6.isOn = false }
        
        if alarmData.rainAlarm == "Y" {
            switch7.isOn = true
        }
        else { switch7.isOn = false }
        
        if alarmData.snowAlarm == "Y" {
            switch8.isOn = true
        }
        else { switch8.isOn = false }
        
        if alarmData.sun == "Y" {
            selectOptionBtnAction(SunButton)
        }

        if alarmData.mon == "Y" {
            selectOptionBtnAction(MonButton)
        }
        
        if alarmData.tue == "Y" {
            selectOptionBtnAction(TuesButton)
        }
        
        if alarmData.wed == "Y" {
            selectOptionBtnAction(WedButton)
        }
        
        if alarmData.thu == "Y" {
            selectOptionBtnAction(ThursButton)
        }
        
        if alarmData.fri == "Y" {
            selectOptionBtnAction(FriButton)
        }
        
        if alarmData.sat == "Y" {
            selectOptionBtnAction(SatButton)
        }
    }
    
    // OO님이~ 부분 사용자 이름 데이터 넣어주기
    func NameSuccessAPI(_ result : UserModel) {
        self.nameData = result
        nickname = nameData.name
        userLabel.text = nickname + "님의 데이터를 분석한 기상 예보를 받을 수 있어요."
    }
}
