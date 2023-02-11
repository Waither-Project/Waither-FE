//
//  TmpViewController.swift
//  Waither_UI
//
//  Created by 최다경 on 2023/01/18.
//

import UIKit

class TmpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(named: "naviBarColor")
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
    }

}
