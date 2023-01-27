//
//  MainPageViewController.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet var backgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        let mainPageNib = UINib(nibName: "MainPageTableViewCell", bundle: nil)
        mainTableView.register(mainPageNib, forCellReuseIdentifier: "MainPageTableViewCell")
    }
    
    // 그라데이션 배경
    func setBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.7, green: 0.65, blue: 0.61, alpha: 0.7).cgColor, UIColor(red: 0.43, green: 0.515, blue: 0.583, alpha: 0.7).cgColor,UIColor(red: 0.463, green: 0.482, blue: 0.498, alpha: 0.7).cgColor]
        gradientLayer.shouldRasterize = true
        backgroundView.layer.addSublayer(gradientLayer)
    }

}

// MARK: - 메인 페이지 tableView delegate
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    // 테이블 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 테이블 셀 값
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPageTableViewCell", for: indexPath) as? MainPageTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 670
    }
    
}
