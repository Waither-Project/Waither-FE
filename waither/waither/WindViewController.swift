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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    @objc func sliderChanged() {
        //print(Int(verticalSlider.value))
        label.text = String(Int(verticalSlider.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    /*
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    */
}
