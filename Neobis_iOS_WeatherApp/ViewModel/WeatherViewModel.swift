//
//  WeatherViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 17/2/24.
//

import Foundation
import UIKit

protocol WeatherViewModelType {
    
    var didTapSearch: (() -> Void)? { get set }
    
    var updateSearch: ((Weather) -> Void)? { get set }
    //var updateForecast: ((Forecast) -> Void)? { get set }
    
    func fetchWeatherData(cityName: String)
}

class WeatherViewModel: WeatherViewModelType {
    
    private var weatherService: WeatherService!
    
    var updateSearch: ((Weather) -> Void)?
    
    private(set) var weatherData : Weather? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> Void) = {}
    
    

    
    lazy var didTapSearch: (() -> Void)? = { [weak self] in
        self?.updateSearch?(self?.weatherData ?? Weather(name: "", sys: CityInfo(type: 0, id: 0, country: "", sunrise: 0, sunset: 0), weather: [], main: MainInfo(temp: 0.0, feels_like: 0.0, temp_min: 0.0, temp_max: 0.0, pressure: 0, humidity: 0), visibility: 0, wind: WindInfo(speed: 0.0, deg: 0)))
    }
    
    
    
    init() {
        self.weatherService = WeatherService()
        fetchWeatherData(cityName: "Marbella") // Получение данных о погоде для Лондона
        //fetchWeekWeatherData(cityName: "London") // Получение прогноза погоды на неделю для Лондона
    }

    func fetchWeatherData(cityName: String) {
        weatherService.fetchWeather(cityName: cityName) { [weak self] weatherData in
            // Вызываем замыкание updateSearch с полученными данными
            self?.updateSearch?(weatherData)
        }
    }
    
}
