//
//  MainPageTableViewCell.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit
import SnapKit

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
    // onoff - Wind
    @IBOutlet weak var onoffWindTitleView: UIView!
    @IBOutlet weak var onoffWindTitle: CustomLabel!
    @IBOutlet weak var onoffWindImage: UIImageView!
    @IBOutlet weak var onoffWindVecLabel: CustomLabel!
    @IBOutlet weak var onoffWindBar: UIView!
    @IBOutlet weak var onoffWindWsdLabel: CustomLabel!
    // onoff - Rain
    @IBOutlet weak var onoffRainTitleView: UIView!
    @IBOutlet weak var onoffRainTitle: CustomLabel!
    @IBOutlet weak var onoffRainImage: UIImageView!
    @IBOutlet weak var onoffRainRn1Label: UILabel!
    // onoff - Dust
    @IBOutlet weak var onoffDustTitleView: UIView!
    @IBOutlet weak var onoffDustTitle: CustomLabel!
    @IBOutlet weak var onoffDustImage: UIImageView!
    @IBOutlet weak var onoffDustPm10GradeLabel: CustomLabel!
    @IBOutlet weak var onoffDustBar: UIView!
    @IBOutlet weak var onoffDustPm10ValueLabel: UILabel!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    var weatherInfoData : WeatherInfoModel!
    
    @IBAction func settingButton(_ sender: UIButton) {
            print("버튼 클릭")
            let vc = UserDataViewController(nibName: "UserDataViewController", bundle: nil)
            self.inputViewController?.navigationController?.pushViewController(vc, animated: true)
        }
    
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
        if let onoffVec = cellData.vec { // 풍향
            let NEmin = onoffVec > 22, NEmax = onoffVec <= 67
            let Emin = onoffVec > 67, Emax = onoffVec <= 112
            let SEmin = onoffVec > 112, SEmax = onoffVec <= 157
            let Smin = onoffVec > 157, Smax = onoffVec <= 202
            let SWmin = onoffVec > 202, SWmax = onoffVec <= 247
            let Wmin = onoffVec > 247, Wmax = onoffVec <= 292
            let NWmin = onoffVec > 292, NWmax = onoffVec <= 337
            let Nmin = onoffVec > 337, Nmax = onoffVec <= 22
            if NEmin && NEmax { onoffWindVecLabel.text = "북동"}
            else if Emin && Emax { onoffWindVecLabel.text = "동풍"}
            else if SEmin && SEmax { onoffWindVecLabel.text = "남동"}
            else if Smin && Smax { onoffWindVecLabel.text = "남풍"}
            else if SWmin && SWmax { onoffWindVecLabel.text = "남서"}
            else if Wmin && Wmax { onoffWindVecLabel.text = "서풍"}
            else if NWmin && NWmax { onoffWindVecLabel.text = "북서"}
            else if Nmin && Nmax { onoffWindVecLabel.text = "북풍"}
        }
        if let onoffWsd = cellData.wsd { onoffWindWsdLabel.text = "\(onoffWsd)m/s"}
        if let onoffRn1 = cellData.rn1 { onoffRainRn1Label.text = "\(onoffRn1)mm"}
        if let onoffPm10Grade = cellData.pm10_grade { onoffDustPm10GradeLabel.text = onoffPm10Grade }
        if let onoffPm10Value = cellData.pm10_value { onoffDustPm10ValueLabel.text = "\(onoffPm10Value)㎍/m³" }
        
        weatherInfoData = cellData
        forecastCollectionView.reloadData()
    }
    
    // onoff data 설정
    public func setOnoffData(_ cellData: SettingsMainModel) {
        if let onoffWind = cellData.wind, let onoffRain = cellData.rainFall, let onoffDust = cellData.dust {
            if onoffWind == "Y" && onoffRain == "Y" && onoffDust == "Y" {
                onoffWindTitleView.snp.remakeConstraints { make in
                    make.top.equalTo(onoffView.snp.top).offset(50)
                    make.leading.equalTo(onoffView.snp.leading).offset(25)
                    make.size.height.equalTo(20)
                    make.size.width.equalTo(68)
                }
                /*
                onoffWindTitle.snp.makeConstraints { make in
                    make.top.equalTo(onoffWindTitleView.snp.top)
                    make.size.height.equalTo(20)
//                    make.size.width.equalTo(42)
                }
                onoffWindImage.snp.makeConstraints { make in
                    make.top.equalTo(onoffWindTitleView.snp.bottom).offset(19)
                    make.left.equalTo(onoffView.snp.left).offset(38)
                    make.size.width.equalTo(34)
                }
                onoffWindVecLabel.snp.makeConstraints { make in
                    make.top.equalTo(onoffView.snp.top).offset(62)
                    make.left.equalTo(onoffWindImage.snp.right).offset(21)
                }
                onoffWindBar.isHidden = true
                onoffWindWsdLabel.snp.makeConstraints { make in
                    make.top.equalTo(onoffWindVecLabel.snp.top).offset(3)
                    make.left.equalTo(onoffWindVecLabel.snp.left)
                }
                 */
                onoffWindTitle.isHidden = true
                onoffWindImage.isHidden = true
                onoffWindVecLabel.isHidden = true
                onoffWindBar.isHidden = true
                onoffWindWsdLabel.isHidden = true
                /*
                onoffRainTitleView.snp.makeConstraints { make in
                    make.top.equalTo(onoffWindTitleView.snp.top)
                    make.left.equalTo(onoffWindTitleView.snp.right).offset(94)
                    make.size.height.equalTo(20)
                    make.size.width.equalTo(68)
                }
                onoffRainTitle.snp.makeConstraints { make in
                    make.center.equalTo(onoffRainTitleView.center)
                }
                onoffRainImage.snp.makeConstraints { make in
                    make.top.equalTo(onoffRainTitleView.snp.bottom).offset(17)
                }
                onoffRainRn1Label.snp.makeConstraints { make in
                    make.top.equalTo(onoffRainTitleView.snp.bottom).offset(33)
                    make.left.equalTo(onoffRainImage.snp.right).offset(20)
                }
                 */
                onoffRainTitleView.isHidden = true
                onoffRainTitle.isHidden = true
                onoffRainImage.isHidden = true
                onoffRainRn1Label.isHidden = true
                //Hidden
                onoffDustTitleView.isHidden = true
                onoffDustTitle.isHidden = true
                onoffDustImage.isHidden = true
                onoffDustPm10GradeLabel.isHidden = true
                onoffDustBar.isHidden = true
                onoffDustPm10ValueLabel.isHidden = true
            }
        }
    }
}

// 섹션5 - 컬렉션뷰 처리
extension MainPageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forecastCollectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath) as? ForecastCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.item == 0 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+1)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp1 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        else if indexPath.item == 1 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+2)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp2 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        else if indexPath.item == 2 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+3)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp3 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        else if indexPath.item == 3 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+4)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp4 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        else if indexPath.item == 4 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+5)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp5 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        else if indexPath.item == 5 {
            if let forecastTime = weatherInfoData?.time?.components(separatedBy: "00") {
                cell.timeLabel.text = "\((Int(forecastTime[0])!+6)%24)시" }
            if let forecastTmp = weatherInfoData?.expect_tmp6 { cell.temLabel.text = "\(forecastTmp)°C"}
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 127)
    }
    
}
