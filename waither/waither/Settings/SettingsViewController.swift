//
//  SettingsViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/12.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    
    var settingData : SettingsMainModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Black", size: 15)!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingsMainDataManager().settingsmainDataManager(self)

        switch1.transform = CGAffineTransformMakeScale(0.75, 0.75);
        switch2.transform = CGAffineTransformMakeScale(0.75, 0.75);
        switch3.transform = CGAffineTransformMakeScale(0.75, 0.75);
    }
}

extension SettingsViewController {
    // MARK: 설정 메인화면 조회 API success
    func SettingsSuccessAPI(_ result : SettingsMainModel) {
        self.settingData = result
        print("rainFall: " + settingData.rainFall)
        print("wind: " + settingData.wind)
        print("dust: " + settingData.dust)
        
        if settingData.rainFall == "Y" {
            switch1.isOn = true
        }
        else { switch1.isOn = false }
        
        if settingData.wind == "Y" {
            switch2.isOn = true
        }
        else { switch2.isOn = false }
        
        if settingData.dust == "Y" {
            switch3.isOn = true
        }
        else { switch3.isOn = false }
    }
}
