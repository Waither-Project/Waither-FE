//
//  WeatherInfoDataManager.swift
//  waither
//
//  Created by 최승희 on 2023/02/04.
//

import Alamofire

class WeatherInfoDataManager {
    func weatherInfoDataManager(_ parameters : WeatherInfoInput, _ viewcontroller : MainPageViewController) {
        AF.request("https://www.waither.shop/app/main/",
                   method: .get,
                   parameters: parameters)
        .validate()
        .responseDecodable(of: APIModel<WeatherInfoModel>.self) { response in
            switch response.result {
            case .success(let result):
                viewcontroller.WeatherInfoSuccessAPI(result.result!)
                print("성공")
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func settingsMainDataManager(_ parameter : SettingsMainInput, _ viewcontroller : MainPageViewController) {
        AF.request("https://www.waither.shop/users/settings",
                   method: .get,
                   parameters: parameter)
        .validate().responseDecodable(of: APIModel<SettingsMainModel>.self) { response in
            switch response.result {
                case .success(let result):
                viewcontroller.SettingsMainSuccessAPI(result.result!)
                print(result.result!)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
