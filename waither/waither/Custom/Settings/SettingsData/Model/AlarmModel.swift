//
//  AlarmModel.swift
//  waither
//
//  Created by 김유빈 on 2023/02/04.
//

import Foundation

struct AlarmModel: Decodable {
    let sun, mon, tue, wed, thu, fri, sat: String
    let outTime, outAlarm, climateAlarm, customAlarm, rainAlarm, snowAlarm: String
}
