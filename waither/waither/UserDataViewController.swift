//
//  UserDataViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/18.
//

import UIKit
import CircleSlider

class UserDataViewController: UIViewController {
    @IBOutlet weak var circleSlider: CircleSlider!
    
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.layer.masksToBounds = true
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    
}
