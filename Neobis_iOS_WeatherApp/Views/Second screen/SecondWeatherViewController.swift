//
//  SecondWeatherViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit
import SnapKit

class SecondWeatherViewController: UIViewController {
    


    var viewModel: WeatherViewModelType!
    let secondView = SecondUIView()
    
    var weatherViewModel: WeatherViewModelType!
    
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
                self?.secondView.collectionView.reloadData()
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
    
    func fillData(with data: WeatherModel) {
        
        secondView.secondDateLabel.text = "\(weatherViewModel.convertDateString(data.list?[0].dt_txt ?? "26 Апреля"))"
        
    }
    
}

//MARK: CollectionView extension
extension SecondWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("тут вывод первых 5и",viewModel.firstFiveWeather)
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! WeatherCollectionViewCell
        let temp = viewModel.firstFiveWeather[indexPath.row]
        cell.configureData(weekDay: temp.time, image: temp.icon, temp: "\(temp.temp) °C")
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
