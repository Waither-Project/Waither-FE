//
//  WindAlarmDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Alamofire

class WindAlarmDataManager {
    func windalarmDataManager(_ viewcontroller : WindViewController) {
        AF.request("https://www.waither.shop/users/settings/alarm/wind?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<WindAlarmModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.WindAlarmSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func nameDataManager(_ viewcontroller : WindViewController) {
        AF.request("https://www.waither.shop/users/settings/user?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<UserModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.NameSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
