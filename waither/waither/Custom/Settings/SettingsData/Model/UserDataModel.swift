//
//  UserDataModel.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Foundation

// MARK: - UserDataModel
struct UserDataModel: Decodable {
    let veryHot, hot, good, cold, veryCold: Int
    let veryHotMode, hotMode, goodMode, coldMode, veryColdMode: Int
    let vh_p, h_p, g_p, c_p, vc_p: Int
}

