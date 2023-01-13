//
//  MainPageTableViewCell.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {

    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var normView: UIView!
    @IBOutlet weak var onoffView: UIView!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView(view: UIView) {
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 16
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 217, green: 217, blue: 217, alpha: 0.9).cgColor
        
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.25).cgColor
        view.layer.shadowOffset = CGSize(width: -1, height: -1)
        view.layer.shadowRadius = 4

        view.layer.masksToBounds = false
    }
    
}
