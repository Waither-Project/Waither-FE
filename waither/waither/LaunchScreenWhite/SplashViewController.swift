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
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut,
                       animations: { self.view.alpha = 1 },
                       completion: {
                            finished in let Storyboard = UIStoryboard.init(name: "Login", bundle: nil) //splash 종료 후 Login 화면으로 이동
                        
            let nextVC = Storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                            let navController = UINavigationController(rootViewController: nextVC)
                            navController.modalTransitionStyle = .coverVertical
                            navController.modalPresentationStyle = .fullScreen
                            self.present(navController, animated:true, completion: nil)
                        
                        }
        )

    }

}
