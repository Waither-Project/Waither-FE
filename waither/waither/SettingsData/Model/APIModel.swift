//
//  APIModel.swift
//  waither
//
//  Created by 김유빈 on 2023/02/11.
//

import Foundation

struct APIModel<T: Decodable>: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: T?
}
