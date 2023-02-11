//
//  MainPageViewController.swift
//  waither
//
//  Created by 최승희 on 2023/01/11.
//

import UIKit
import CoreLocation

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet var backgroundView: UIView!
    
    var locationManager : CLLocationManager!
    var weatherInfoData : WeatherInfoModel!
    var settingsMainData : SettingsMainModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SF Pro Black", size: 15)!, .foregroundColor: UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        let mainPageNib = UINib(nibName: "MainPageTableViewCell", bundle: nil)
        mainTableView.register(mainPageNib, forCellReuseIdentifier: "MainPageTableViewCell")
        
        // 위치 + 날씨 정보 api
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        let weatherInfoInput = WeatherInfoInput(x: 37.564747, y: 127.029500)
        WeatherInfoDataManager().weatherInfoDataManager(weatherInfoInput, self)
        
        // 설정 메인화면 조회 api
        let settingsMainInput = SettingsMainInput(userIdx: 1)
        WeatherInfoDataManager().settingsMainDataManager(settingsMainInput, self)
    }
    
    // 그라데이션 배경
    func setBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.7, green: 0.65, blue: 0.61, alpha: 0.7).cgColor,
            UIColor(red: 0.43, green: 0.515, blue: 0.583, alpha: 0.7).cgColor,
            UIColor(red: 0.463, green: 0.482, blue: 0.498, alpha: 0.7).cgColor]
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
        
        // 데이터 전달
        if let cellData = self.weatherInfoData {
            // if data exists
            cell.setWeatherInfoData(cellData)
//            ForecastCollectionViewCell.setCellWeatherData(cellData)
            
        }
        if let cellData = self.settingsMainData {
            // if data exists
            cell.setOnoffData(cellData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 670
    }
    
}

// MARK: - 메인 페이지 CLLocationManager delegate
extension MainPageViewController : CLLocationManagerDelegate {
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus, didUpdateLocations locations: [CLLocation]) {
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                print("GPS 권한 설정됨")
                self.locationManager.startUpdatingLocation() // 중요!
            case .restricted, .notDetermined:
                print("GPS 권한 설정되지 않음")
                getLocationUsagePermission()
            case .denied:
                print("GPS 권한 요청 거부됨")
                getLocationUsagePermission()
            default:
                print("GPS: Default")
            }
        
//        let location: CLLocation = locations[locations.count - 1]   // 최근 위치
//        let longtitude: CLLocationDegrees = location.coordinate.longitude   // 경도
//        let latitude : CLLocationDegrees = location.coordinate.latitude   // 위도
//        print("경도: \(longtitude), 위도: \(latitude)")
    }
}

// MARK: - 메인 페이지 API
extension MainPageViewController {
    //MARK: 기상 정보 API success
    func WeatherInfoSuccessAPI(_ result : WeatherInfoModel) {
        self.weatherInfoData = result
        mainTableView.reloadData()
    }
    
    //MARK: 설정 메인화면 조회 API success
    func SettingsMainSuccessAPI(_ result : SettingsMainModel) {
        self.settingsMainData = result
        mainTableView.reloadData()
    }
}
