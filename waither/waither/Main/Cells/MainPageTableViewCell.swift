//
//  MainPageTableViewCell.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {
    static let identifier = "MainPageTableViewCell"

    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var notiSmallLabel: UILabel!
    @IBOutlet weak var notiBigLabel: UILabel!
    @IBOutlet weak var notiWeatherImage: UIImageView!
    
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var personalSmallLabel: UILabel!
    @IBOutlet weak var personalBigLabel: UILabel!
    
    @IBOutlet weak var normView: UIView!
    @IBOutlet weak var normBackView: UIView!
    @IBOutlet weak var normLocationLabel: UILabel!
    @IBOutlet weak var normTemLabel: UILabel!
    @IBOutlet weak var normLowestLabel: UILabel!
    @IBOutlet weak var normTopLabel: UILabel!
    @IBOutlet weak var normWeatherImage: UIImageView!
    
    @IBOutlet weak var onoffView: UIView!
    @IBOutlet weak var onoffBackView: UIView!
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
        let forecastNib = UINib(nibName: ForecastCollectionViewCell.identifier, bundle: nil)
        forecastCollectionView.register(forecastNib, forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier)
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
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
        
        if (view == normView || view == onoffView || view == forecastCollectionView) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.type = .radial
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.frame = view.layer.bounds
            gradientLayer.colors = [
                UIColor(red: 217, green: 217, blue: 217, alpha: 0.05).cgColor,
                UIColor(red: 217, green: 217, blue: 217, alpha: 0.15).cgColor
            ]
            gradientLayer.shouldRasterize = true
            gradientLayer.cornerRadius = 16
            view.layer.addSublayer(gradientLayer)
        }
                
    }
    
    // 섹션4 특정
    func setOnoffView() {
        onoffView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        onoffWindTitleView.layer.cornerRadius = 10
        onoffRainTitleView.layer.cornerRadius = 10
        onoffDustTitleView.layer.cornerRadius = 10
    }
}

// 섹션5 - 컬렉션뷰 처리
extension MainPageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forecastCollectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath) as? ForecastCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 127)
    }
    
}
