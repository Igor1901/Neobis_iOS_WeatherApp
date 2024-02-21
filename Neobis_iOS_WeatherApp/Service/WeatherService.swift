//
//  WeatherService.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 15/2/24.
//

import Foundation

class WeatherService {
    let apiKey = "ab4b6ccab4d22e72f27428ed0b5d3c67"
    
    func fetchWeather(city: String, completion: @escaping (WeatherModel) -> ()) {
        let BASE_URL =  "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: BASE_URL) else {
            fatalError("Wrond City name")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error with data!")
                return
            }
            
            var resultData: WeatherModel?
            
            do {
                resultData = try JSONDecoder().decode(WeatherModel.self, from: data)
            } catch {
                print("Failed to decode data!")
            }
            
            guard let final = resultData else {
                return
            }
            completion(final)
        }
        task.resume()
    }
      
      
}
