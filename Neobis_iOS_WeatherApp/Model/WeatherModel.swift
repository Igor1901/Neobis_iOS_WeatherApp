//
//  WeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 15/2/24.
//

import Foundation
/*
 
struct Weather: Codable {
    let name: String
    //let sys: CityInfo
    let weather: [WeatherInfo]?
    let main: MainInfo
    //let visibility: Int
    let wind: WindInfo
    let dt_txt: String
}
/*
struct CityInfo: Codable {
    let type: Int
    //let id: Int
    //let country: String
    //let sunrise: Int
    //let sunset: Int
}
*/

struct WeatherInfo: Codable {
    //let id: Int
    let main: String
    //let description: String
    let icon: String
}

struct MainInfo: Codable {
    let temp: Double
    //let feels_like: Double
    //let temp_min: Double
    //let temp_max: Double
    //let pressure: Int
    let humidity: Int
}

struct WindInfo: Codable {
    let speed: Double
    //let deg: Int
}


struct Forecast: Codable {
    let list: [WeatherData]
}

struct WeatherData: Codable {
    let main: TemperatureData
}

struct TemperatureData: Codable {
    let temp: Double
}
*/

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
