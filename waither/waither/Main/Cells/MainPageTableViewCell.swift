//
//  MainPageTableViewCell.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {

    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var notiSmallLabel: UILabel!
    @IBOutlet weak var notiBigLabel: UILabel!
    @IBOutlet weak var notiWeatherImage: UIImageView!
    
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var personalSmallLabel: UILabel!
    @IBOutlet weak var personalBigLabel: UILabel!
    
    @IBOutlet weak var normView: UIView!
    @IBOutlet weak var normLocationLabel: UILabel!
    @IBOutlet weak var normTemLabel: UILabel!
    @IBOutlet weak var normLowestLabel: UILabel!
    @IBOutlet weak var normTopLabel: UILabel!
    @IBOutlet weak var normWeatherImage: UIImageView!
    
    @IBOutlet weak var onoffView: UIView!
    @IBOutlet weak var onoffWindTitleView: UIView!
    @IBOutlet weak var onoffRainTitleView: UIView!
    @IBOutlet weak var onoffDustTitleView: UIView!
    
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
    
    // 모든 섹션
    func setView(view: UIView) {
        view.layer.cornerRadius = 16
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 217, green: 217, blue: 217, alpha: 0.9).cgColor

        view.layer.masksToBounds = false
    }
    
    // 섹션4 특정
    func setOnoffView() {
        onoffWindTitleView.layer.cornerRadius = 10
        onoffRainTitleView.layer.cornerRadius = 10
        onoffDustTitleView.layer.cornerRadius = 10
    }
}