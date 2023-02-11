//
//  UserDataModel.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Foundation

// MARK: - UserDataModel
struct UserDataModel: Decodable {
    let veryCold, cold, good, hot, veryHot: Int
    let avgVC, avgC, avgG, avgH, avgVH : Int
}

