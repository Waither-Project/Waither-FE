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
        if let onoffVec = cellData.vec {
            let NEmin = onoffVec > 22, NEmax = onoffVec <= 67
            let Emin = onoffVec > 67, Emax = onoffVec <= 112
            let SEmin = onoffVec > 112, SEmax = onoffVec <= 157
            let Smin = onoffVec > 157, Smax = onoffVec <= 202
            let SWmin = onoffVec > 202, SWmax = onoffVec <= 247
            let Wmin = onoffVec > 247, Wmax = onoffVec <= 292
            let NWmin = onoffVec > 292, NWmax = onoffVec <= 337
            let Nmin = onoffVec > 337, Nmax = onoffVec <= 22
            if NEmin && NEmax { onoffVecLabel.text = "북동"}
            else if Emin && Emax { onoffVecLabel.text = "동"}
            else if SEmin && SEmax { onoffVecLabel.text = "남동"}
            else if Smin && Smax { onoffVecLabel.text = "남"}
            else if SWmin && SWmax { onoffVecLabel.text = "남서"}
            else if Wmin && Wmax { onoffVecLabel.text = "서"}
            else if NWmin && NWmax { onoffVecLabel.text = "북서"}
            else if Nmin && Nmax { onoffVecLabel.text = "북"}
        }
        if let onoffWsd = cellData.wsd { onoffWsdLabel.text = "\(onoffWsd)m/s"}
        if let onoffRn1 = cellData.rn1 { onoffRn1Label.text = "\(onoffRn1)mm"}
        if let onoffPm10Grade = cellData.pm10_grade { onoffPm10GradeLabel.text = onoffPm10Grade }
        if let onoffPm10Value = cellData.pm10_value { onoffPm10ValueLabel.text = "\(onoffPm10Value)㎍/m³" }
    }
    
    // onoff data 설정
    public func setOnoffData(_ cellData: SettingsMainModel) {
        if let onoffWind = cellData.wind, let onoffRain = cellData.rainFall, let onoffDust = cellData.dust {
            if onoffWind == "Y" && onoffRain == "Y" && onoffDust == "N" {
                
            }
        }
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
