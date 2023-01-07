//
//  SplashViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/07.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseOut
                       , animations: { self.view.alpha = 1 },
                       completion: { finished in let Storyboard = UIStoryboard.init(name: "Main", bundle: nil) //splash 종료 후 Login 화면으로 이동
                                        guard let VC = Storyboard.instantiateViewController(identifier: "Login") as? ViewController else { return }
                                        self.present(VC, animated: false, completion: nil)
                        }
        )

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
