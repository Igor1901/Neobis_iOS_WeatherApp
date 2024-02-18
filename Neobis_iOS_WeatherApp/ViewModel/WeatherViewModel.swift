//
//  WeatherViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 17/2/24.
//

import Foundation
import UIKit

protocol WeatherViewModelType {
    
    
    func fetchWeatherData(cityName: String)
}

class WeatherViewModel: WeatherViewModelType {
    
    private var weatherService: WeatherService!
    
    private(set) var weatherData : Weather? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> Void) = {}
    
    init() {
        self.weatherService = WeatherService()
        fetchWeatherData(cityName: "Marbella") // Получение данных о погоде для Лондона
        //fetchWeekWeatherData(cityName: "London") // Получение прогноза погоды на неделю для Лондона
    }

    func fetchWeatherData(cityName: String) {
        weatherService.fetchWeather(cityName: cityName) { (weatherData) in
            self.weatherData = weatherData
        }
    }
    
}
