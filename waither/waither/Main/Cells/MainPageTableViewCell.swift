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
    @IBOutlet weak var windTitleView: UIView!
    @IBOutlet weak var rainTitleView: UIView!
    @IBOutlet weak var dustTitleView: UIView!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clear
        setView(view: notiView)
        setView(view: personalView)
        setView(view: normView)
        setView(view: onoffView)
        setOnoffView()
        setView(view: forecastCollectionView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView(view: UIView) {
        view.layer.cornerRadius = 16
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 217, green: 217, blue: 217, alpha: 0.9).cgColor

        view.layer.masksToBounds = false
    }
    
    func setOnoffView() {
        windTitleView.layer.cornerRadius = 10
        rainTitleView.layer.cornerRadius = 10
        dustTitleView.layer.cornerRadius = 10
    }
}
