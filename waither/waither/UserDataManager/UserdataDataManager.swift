//
//  UserdataDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/01/24.
//

import Alamofire

class UserdataDataManager {
    func userdataDataManager() {
        AF.request("http://www.waither.shop/app/settings/user",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserdataModel.self) { response in
            switch response.result {
            case .success(_):
                print("성공")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


