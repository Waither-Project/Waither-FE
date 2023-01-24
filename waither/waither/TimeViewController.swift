//
//  TimeViewController.swift
//  waither
//
//  Created by 김유빈 on 2023/01/17.
//

import UIKit

protocol SendDataDelegate {
    func sendData(data: String)
}

class TimeViewController: UIViewController {
    var delegate: SendDataDelegate?
    
    var alarmtime: String = ""
    
    @IBAction func closeBtn(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var popupView: UIView!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        delegate?.sendData(data: alarmtime)
        self.presentingViewController?.dismiss(animated: true)
    }

    @IBAction func changeTime(_ sender: UIDatePicker) {
        let datePicker = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "a HH:mm"
        alarmtime = formatter.string(from: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 20
        popupView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popupView.layer.masksToBounds = true
    }
}
