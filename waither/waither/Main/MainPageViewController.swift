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
    
    var weatherInfoData : WeatherInfoModel!
    var settingsMainData : SettingsMainModel!
    
    lazy var locationManager: CLLocationManager = { // 위치 매니저
            let manager = CLLocationManager()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.distanceFilter = kCLHeadingFilterNone
            manager.requestWhenInUseAuthorization()
            manager.delegate = self
            return manager
        }()
    
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
        locationManager.startUpdatingLocation()
        let latitude = locationManager.location?.coordinate.latitude // 위도
        let longitude = locationManager.location?.coordinate.longitude // 경도
        let weatherInfoInput = WeatherInfoInput(x: 37.54535029510736, y: 126.9524566286246)
        WeatherInfoDataManager().weatherInfoDataManager(weatherInfoInput, self)
        
        // 설정 메인화면 조회 api
        let settingsMainInput = SettingsMainInput(userIdx: 1)
        WeatherInfoDataManager().settingsMainDataManager(settingsMainInput, self)
    }
    
    // 그라데이션 배경
    func setBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = UIColor.cloudyGradientColor
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
        if let cellWeatherData = self.weatherInfoData {
            // if data exists
            cell.setWeatherInfoData(cellWeatherData)
            
        }
        if let cellSettingsData = self.settingsMainData {
            // if data exists
            cell.setOnoffData(cellSettingsData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 690
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
