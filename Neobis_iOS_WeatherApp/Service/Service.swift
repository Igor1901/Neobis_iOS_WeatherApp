//
//  Service.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 15/2/24.
//

import Foundation

class WeatherService {
    let apiKey = "ab4b6ccab4d22e72f27428ed0b5d3c67"
    
    func fetchWeather(cityName: String, completion: @escaping (Weather) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Data Task Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            

            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(weather)
                print(weather)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}
