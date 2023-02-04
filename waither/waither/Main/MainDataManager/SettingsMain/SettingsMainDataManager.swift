//
//  SettingsMainDataManager.swift
//  waither
//
//  Created by 최승희 on 2023/02/04.
//

import Alamofire

class SettingsMainDataManager {
    func settingsMainDataManager(_ parameter : SettingsMainInput) {
        AF.request("https://www.waither.shop/users/settings",
                   method: .get,
                   parameters: parameter)
        .validate().responseDecodable(of: SettingsMainModel.self) { response in
            switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
