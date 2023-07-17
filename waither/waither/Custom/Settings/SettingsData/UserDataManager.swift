//
//  UserDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Alamofire

class UserDataManager {
    func userDataManager(_ viewcontroller : PrivacyViewController) {
        AF.request("https://www.waither.shop/users/settings/user?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<UserModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.UserSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
