//
//  WeatherViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 14/2/24.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {

    let mainView = MainUIView()
    
    var weatherModel: Weather?
    
    var weatherViewModel: WeatherViewModelType!

    init(vm: WeatherViewModelType) {
        weatherViewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        weatherViewModel.updateSearch = { [weak self] weather in
            self?.weatherModel = weather
            self?.mainView.fillData(with: weather)
            // Вызываем didTapSearch только после успешного обновления данных
            //self?.weatherViewModel.didTapSearch?()
            print("Received updated weather data:", weather) // Добавьте этот print для проверки
        }
        // Вызываем didTapSearch из контроллера
        //weatherViewModel.didTapSearch?()
        print("123", weatherModel)
        */
        // Присваиваем замыкание weatherViewModel.updateSearch
        weatherViewModel.updateSearch = { [weak self] weather in
            DispatchQueue.main.async { // Обновление интерфейса должно происходить на основном потоке
                self?.mainView.fillData(with: weather)
                print("Received updated weather data:", weather)
            }
        }
        
        // Вызываем метод fetchWeatherData для загрузки данных
        weatherViewModel.fetchWeatherData(cityName: "Marbella")

    }


}

