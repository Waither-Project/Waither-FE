//
//  SettingsMainDataManager.swift
//  waither
//
//  Created by 김유빈 on 2023/02/03.
//

import Alamofire

class SettingsMainDataManager {
    func settingsmainDataManager(_ viewcontroller : SettingsViewController) {
        AF.request("https://www.waither.shop/users/settings?userIdx=1",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: APIModel<SettingsModel>.self) { response in
            switch response.result {
            case .success(let value):
                viewcontroller.SettingsSuccessAPI(value.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
