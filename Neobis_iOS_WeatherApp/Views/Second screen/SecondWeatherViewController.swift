//
//  SecondWeatherViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit
import SnapKit

class SecondWeatherViewController: UIViewController {
    
    let hourlyWeather1 = [
        hourlyWeather(temp: "29°C", image: "sunAndClouds", time: "15:00"),
        hourlyWeather(temp: "26°C", image: "sunAndClouds", time: "16:00"),
        hourlyWeather(temp: "24°C", image: "clouds", time: "17:00"),
        hourlyWeather(temp: "23°C", image: "cloudsWithMoon", time: "18:00"),
        hourlyWeather(temp: "22°C", image: "cloudsWithMoon", time: "19:00"),
    ]
    /*
    let weeklyWeather = [
        WeekWeatherModel(temp: "21°C", image: "rainy", time: "Апр, 27"),
        WeekWeatherModel(temp: "22°C", image: "rainyCloud", time: "Апр, 28"),
        WeekWeatherModel(temp: "34°C", image: "sun1", time: "Апр, 29"),
        WeekWeatherModel(temp: "27°C", image: "cloudy", time: "Апр, 30"),
        WeekWeatherModel(temp: "32°C", image: "sunAndClouds", time: "Май, 1"),
    ]
*/
    var viewModel: WeatherViewModelType!
    let secondView = SecondUIView()
    
    
    init(_ vm: WeatherViewModelType) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = vm
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = secondView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.tableView.delegate = self
        secondView.tableView.dataSource = self
        
        secondView.collectionView.delegate = self
        secondView.collectionView.dataSource = self
        // Вызываем метод загрузки данных о погоде из вью-модели
        viewModel.updateSearch = { [weak self] weatherModel in
            DispatchQueue.main.async { // Обновление интерфейса должно происходить на
                // Обновляем таблицу после получения новых данных
                self?.secondView.tableView.reloadData()
            }
            
        }
        setTargets()
    }
    
    

    
    func setTargets() {
        secondView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        dismiss(animated: true)
    }
}

//MARK: CollectionView extension
extension SecondWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeather1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! WeatherCollectionViewCell
        let temp = hourlyWeather1[indexPath.row]
        cell.configure(image: temp.image, tempText: temp.temp, hourText: temp.time, showBorder: (temp.temp == "24°C"))
        return cell
    }
}

//MARK: UITableView extension
extension SecondWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.weekWeather.count)
        return viewModel.weekWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! WeatherTableViewCell
        let temp = viewModel.weekWeather[indexPath.row]
        cell.configureData(weekDay: temp.weekDay, image: temp.image, temp: "\(temp.temp) °C")
        cell.contentView.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
