//
//  PasswordDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/01/18.
//

import Alamofire

class PasswordDataManager {
    func passwordDataManager() {
        AF.request("http://www.waither.shop",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: PasswordModel.self) { response in
            switch response.result {
            case .success(_):
                print("성공")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
