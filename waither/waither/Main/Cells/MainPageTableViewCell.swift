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
    @IBOutlet weak var normLocationLabel: UILabel!
    @IBOutlet weak var normTemLabel: UILabel!
    @IBOutlet weak var normLowestLabel: UILabel!
    @IBOutlet weak var normTopLabel: UILabel!
    @IBOutlet weak var normWeatherImage: UIImageView!
    
    @IBOutlet weak var onoffView: UIView!
    @IBOutlet weak var onoffWindTitleView: UIView!
    @IBOutlet weak var onoffRainTitleView: UIView!
    @IBOutlet weak var onoffDustTitleView: UIView!
    @IBOutlet weak var onoffVecLabel: CustomLabel!
    @IBOutlet weak var onoffWsdLabel: CustomLabel!
    @IBOutlet weak var onoffRn1Label: UILabel!
    @IBOutlet weak var onoffPm10GradeLabel: CustomLabel!
    @IBOutlet weak var onoffPm10ValueLabel: UILabel!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clear

        setOnoffView()
        
        // 섹션5 - 컬렉션뷰
        let forecastNib = UINib(nibName: ForecastCollectionViewCell.identifier, bundle: nil)
        forecastCollectionView.register(forecastNib, forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier)
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 섹션4 특정
    func setOnoffView() {
        onoffWindTitleView.layer.cornerRadius = 10
        onoffRainTitleView.layer.cornerRadius = 10
        onoffDustTitleView.layer.cornerRadius = 10
    }
    
    // data 설정
    public func setWeatherInfoData(_ cellData: WeatherInfoModel) {
        if let normTem = cellData.tmp { normTemLabel.text = "\(normTem)"}
        if let normTen = cellData.tmn { normLowestLabel.text = "최저 \(normTen)°C"}
        if let normTex = cellData.tmx { normTopLabel.text = "최고 \(normTex)°C"}
//        if let onoffVec = cellData.vec {
//            switch onoffVec {
//                case
//            }
//        }
        if let onoffWsd = cellData.wsd { onoffWsdLabel.text = "\(onoffWsd)m/s"}
    }
}

// 섹션5 - 컬렉션뷰 처리
extension MainPageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forecastCollectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath) as? ForecastCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 127)
    }
    
}
