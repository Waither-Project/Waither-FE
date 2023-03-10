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
    
    var settingData : SettingsModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Black", size: 15)!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingsMainDataManager().settingsmainDataManager(self)
        
        self.navigationController?.navigationBar.tintColor = .black
        
        switch1.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch2.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch3.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
    }
}

extension SettingsViewController {
    // MARK: 설정 메인화면 조회 API success
    func SettingsSuccessAPI(_ result : SettingsModel) {
        self.settingData = result
        
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
