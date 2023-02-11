//
//  SaveViewController.swift
//  waither
//
//  Created by 최다경 on 2023/02/01.
//

import UIKit

class SaveViewController: UIViewController {
    @IBOutlet weak var saveView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

                // 2. add the gesture recognizer to a view
                saveView.addGestureRecognizer(tapGesture)
            }

            // 3. this method is called when a tap is recognized
            @objc func handleTap(sender: UITapGestureRecognizer) {
                print("tap")
                let Storyboard = UIStoryboard.init(name: "MainPage", bundle: nil) //splash 종료 후 Login 화면으로 이동
            
                let nextVC = Storyboard.instantiateViewController(withIdentifier: "MainPageVC") as! MainPageViewController
                let navController = UINavigationController(rootViewController: nextVC)
                navController.modalTransitionStyle = .coverVertical
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated:true, completion: nil)

        // Do any additional setup after loading the view.
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
