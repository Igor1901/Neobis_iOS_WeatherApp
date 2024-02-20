//
//  WeekWeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import Foundation

struct WeekWeatherModel: Codable {
    let temp: Int
    let image: String
    let weekDay: String
}
