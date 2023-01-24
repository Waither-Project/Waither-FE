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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Black", size: 15)!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch1.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch2.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
        switch3.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
    }
}
