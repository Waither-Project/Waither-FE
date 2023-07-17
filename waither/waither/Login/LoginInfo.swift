//
//  LoginInfo.swift
//  waither
//
//  Created by eunseo on 2023/02/10.
//

import Foundation

struct LoginInfo: Codable{
    let authId: String
    let email: String
    let nickname: String
    let provider: String
    
    enum CodingKeys:String,CodingKey{
        case authId, email, nickname
        case provider = "kakao"
    }
    
    
}
