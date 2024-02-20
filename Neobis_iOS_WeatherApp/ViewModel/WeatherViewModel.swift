//
//  WeatherViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 17/2/24.
//

import Foundation
import UIKit

protocol WeatherViewModelType {
    
    //var didTapSearch: (() -> Void)? { get set }
    
    var weekWeather: [WeekWeatherModel] { get set }
    
    var updateSearch: ((WeatherModel) -> Void)? { get set }
    //var updateForecast: ((Forecast) -> Void)? { get set }
    
    func fetchWeatherData(cityName: String)
    func convertDateString(_ dateString: String) -> String
    func getHighestTemp(model: WeatherModel) -> Void
}

class WeatherViewModel: WeatherViewModelType {
    
    var weekWeather: [WeekWeatherModel] = []
    
    private var weatherService: WeatherService!
    
    var updateSearch: ((WeatherModel) -> Void)?
    
    private(set) var weatherData : WeatherModel? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> Void) = {}
    
    

    /*
    lazy var didTapSearch: (() -> Void)? = { [weak self] in
        self?.updateSearch?(self?.weatherData ?? Weather(name: "", weather: [], main: MainInfo(temp: 0.0, humidity: 0), wind: WindInfo(speed: 0.0), dt_txt: ""))
    }
     
     
     lazy var didTapSearch: (() -> Void)? = { [weak self] in
         self?.updateSearch?(self?.weatherData ?? WeatherModel(list: [], city: CityDetail(name: "")))
     }
    */
    
    init() {
        self.weatherService = WeatherService()
        fetchWeatherData(cityName: "Marbella") // Получение данных о погоде для Лондона
        //fetchWeekWeatherData(cityName: "London") // Получение прогноза погоды на неделю для Лондона
    }

    func fetchWeatherData(cityName: String) {
        weatherService.fetchWeather(city: cityName) { [weak self] weatherData in
            // Вызываем замыкание updateSearch с полученными данными
            self?.updateSearch?(weatherData)
            
            // Вызываем метод для обновления weekWeather
            self?.getHighestTemp(model: weatherData)
        }
    }
    
    func getHighestTemp(model: WeatherModel) {
        var separatedWeather: [String: [WeatherDetail]] = [:]
            
            for weatherDetail in model.list ?? [] {
                let dateString = String(weatherDetail.dt_txt.prefix(10))
                    if separatedWeather[dateString] != nil {
                        separatedWeather[dateString]?.append(weatherDetail)
                    } else {
                        separatedWeather[dateString] = [weatherDetail]
                    }
            }
        
        let sortedDates = separatedWeather.keys.sorted()
        var index = 0
        weekWeather.removeAll()
        for date in sortedDates {
            if let weatherDetails = separatedWeather[date], let maxTemp = weatherDetails.map({ $0.main.temp }).max() {
                if let maxTempDetail = weatherDetails.first(where: { $0.main.temp == maxTemp }) {
                    if index != 0 {
                        let dayOfWeek = dayOfWeek(from: date)
                        weekWeather.append(WeekWeatherModel(temp: Int(round(maxTempDetail.main.temp)), image: maxTempDetail.weather[0].icon, weekDay: dayOfWeek ?? "Monday"))
                    }
                    index += 1
                }
            }
        }
        print(weekWeather)
    }
    
    func dayOfWeek(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            let standaloneWeekdaySymbols = calendar.standaloneWeekdaySymbols
            return standaloneWeekdaySymbols[dayOfWeek - 1]
        }
        return nil
    }

    
    func convertDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
        
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "d"
            let day = dayFormatter.string(from: date)
            let ordinalSuffix: String
            
            switch day {
            case "1", "21", "31":
                ordinalSuffix = "st"
            case "2", "22":
                ordinalSuffix = "nd"
            case "3", "23":
                ordinalSuffix = "rd"
            default:
                ordinalSuffix = "th"
            }
            
            formatter.dateFormat = "MMMM d'\(ordinalSuffix)', yyyy"
            return formatter.string(from: date)
        }
        
        return "Invalid Date"
    }
    
}
