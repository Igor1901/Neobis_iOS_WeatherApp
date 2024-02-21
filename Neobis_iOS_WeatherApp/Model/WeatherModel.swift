//
//  WeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 15/2/24.
//

import Foundation


struct WeatherModel: Codable {
    let list: [WeatherDetail]?
    let city: CityDetail
}

struct CityDetail: Codable {
    let name: String
}

struct WeatherDetail: Codable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let dt_txt: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let main: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double
}
