//
//  APIModel.swift
//  waither
//
//  Created by 최승희 on 2023/02/05.
//

import Foundation

struct APIModel<T: Decodable>: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: T?
}
