//
//  SaveViewController.swift
//  waither
//
//  Created by 최다경 on 2023/02/01.
//

import UIKit

class SaveViewController: UIViewController {
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "OO님의\n데이터가 저장되었어요."
        label2.text = "이제 웨이더가\nOO님에게 꼭 맞는\n기상예보를 보내드릴게요."
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        saveView.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
        let Storyboard = UIStoryboard.init(name: "MainPage", bundle: nil)
    
        let nextVC = Storyboard.instantiateViewController(withIdentifier: "MainPageVC") as! MainPageViewController
        let navController = UINavigationController(rootViewController: nextVC)
        navController.modalTransitionStyle = .crossDissolve
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated:true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
