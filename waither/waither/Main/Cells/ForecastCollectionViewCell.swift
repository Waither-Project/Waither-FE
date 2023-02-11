//
//  ForecastCollectionViewCell.swift
//  waither
//
//  Created by 최승희 on 2023/01/23.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForecastCollectionViewCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temLabel: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setCellWeatherData(_ cellData: WeatherInfoModel) {
        timeLabel.text = "\(cellData.time?.split(by: 2))시"
    }

}
