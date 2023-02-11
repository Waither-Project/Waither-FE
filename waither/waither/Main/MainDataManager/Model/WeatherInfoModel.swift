//
//  WeatherInfoModel.swift
//  waither
//
//  Created by 최승희 on 2023/02/04.
//

import Foundation

struct WeatherInfoModel : Decodable {
    let date : String?
    let time : String?
    let tmp : Double?
    let tmn : Int?
    let tmx : Int?
    let rn1 : Double?
    let vec : Int?
    let wsd : Double?
    let reh : Double?
    let pm10_value : Int?
    let pm10_grade : String?
    let expect_tmp1 : Double?
    let expect_tmp2 : Double?
    let expect_tmp3 : Double?
    let expect_tmp4 : Double?
    let expect_tmp5 : Double?
    let expect_tmp6 : Double?
    let expect_rn1 : String?
    let expect_rn2 : String?
    let expect_rn3 : String?
    let expect_rn4 : String?
    let expect_rn5 : String?
    let expect_rn6 : String?
    let expect_sky1 : String?
    let expect_sky2 : String?
    let expect_sky3 : String?
    let expect_sky4 : String?
    let expect_sky5 : String?
    let expect_sky6 : String?
}
