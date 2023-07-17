//
//  AlarmDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Alamofire

class AlarmDataManager {
    func alarmDataManager(_ viewcontroller : AlarmViewController) {
        AF.request("https://www.waither.shop/users/settings/alarm?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<AlarmModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.AlarmSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func nameDataManager(_ viewcontroller : AlarmViewController) {
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
