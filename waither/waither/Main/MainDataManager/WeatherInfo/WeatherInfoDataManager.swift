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
        .responseDecodable(of: WeatherInfoModel.self) { response in
            switch response.result {
            case .success(let result):
                viewcontroller.WeatherInfoSuccessAPI(result)
                print("성공")
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
