//
//  UserdataDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Alamofire

class UserdataDataManager {
    func userdataDataManager(_ viewcontroller : UserDataViewController) {
        AF.request("https://www.waither.shop/users/settings/userdata?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<UserDataModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.UserAlarmSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

