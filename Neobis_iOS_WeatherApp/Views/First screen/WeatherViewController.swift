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
    
    var weatherModel: WeatherModel?
    
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

        // Присваиваем замыкание weatherViewModel.updateSearch
        weatherViewModel.updateSearch = { [weak self] weather in
            DispatchQueue.main.async { // Обновление интерфейса должно происходить на основном потоке
                self?.fillData(with: weather)
                print("Received updated weather data:", weather)
            }
        }
        
        // Вызываем метод fetchWeatherData для загрузки данных
        weatherViewModel.fetchWeatherData(cityName: "Marbella")
        setupConstraints()

    }
    
    func fillData(with data: WeatherModel) {
        
        mainView.сityLabel.text = data.city.name
        mainView.sunImage.image = UIImage(named: data.list?[0].weather[0].icon ?? "sun")
        mainView.dateLabel.text = "\(weatherViewModel.convertDateString(data.list?[0].dt_txt ?? "26 Апреля"))"
        
        mainView.temperatureLabel.text = "\(Int(round(data.list?[0].main.temp ?? 0)))°C"
        mainView.titleLabel.text =  data.list?[0].weather[0].main ?? "Солнечно"
        
        mainView.windLabel.text = "Wind | \(Int(round(data.list?[0].wind.speed ?? 0))) m/s"
        mainView.rainLabel.text = "Humidity | \(data.list?[0].main.humidity ?? 0) %"
    }

    func setupConstraints(){
        mainView.weatherButton.addTarget(self, action: #selector(weatherButtonPressed), for: .touchUpInside)
    }

    @objc func weatherButtonPressed() {
        let vc = SecondWeatherViewController(weatherViewModel)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

