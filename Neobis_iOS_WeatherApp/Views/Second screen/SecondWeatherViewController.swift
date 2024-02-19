//
//  SecondWeatherViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit
import SnapKit

class SecondWeatherViewController: UIViewController {
    
    let hourlyWeather = [
        WeatherModel(temp: "29°C", image: "sunAndClouds", time: "15:00"),
        WeatherModel(temp: "26°C", image: "sunAndClouds", time: "16:00"),
        WeatherModel(temp: "24°C", image: "clouds", time: "17:00"),
        WeatherModel(temp: "23°C", image: "cloudsWithMoon", time: "18:00"),
        WeatherModel(temp: "22°C", image: "cloudsWithMoon", time: "19:00"),
    ]
    
    let weeklyWeather = [
        WeatherModel(temp: "21°C", image: "rainy", time: "Апр, 27"),
        WeatherModel(temp: "22°C", image: "rainyCloud", time: "Апр, 28"),
        WeatherModel(temp: "34°C", image: "sun1", time: "Апр, 29"),
        WeatherModel(temp: "27°C", image: "cloudy", time: "Апр, 30"),
        WeatherModel(temp: "32°C", image: "sunAndClouds", time: "Май, 1"),
    ]

    let secondView = SecondUIView()
    
    override func loadView() {
        view = secondView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.tableView.delegate = self
        secondView.tableView.dataSource = self
        
        secondView.collectionView.delegate = self
        secondView.collectionView.dataSource = self
        

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
        return hourlyWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! WeatherCollectionViewCell
        let temp = hourlyWeather[indexPath.row]
        cell.configure(image: temp.image, tempText: temp.temp, hourText: temp.time, showBorder: (temp.temp == "24°C"))
        return cell
    }
}

//MARK: UITableView extension
extension SecondWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! WeatherTableViewCell
        let temp = weeklyWeather[indexPath.row]
        cell.configure(image: temp.image, dateText: temp.time, tempText: temp.temp)
        cell.contentView.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
