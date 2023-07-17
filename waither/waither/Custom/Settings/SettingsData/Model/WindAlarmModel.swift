//
//  WindAlarmModel.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Foundation

struct WindAlarmModel: Decodable {
    let windValue: Int
    let windAlarm: String
}
