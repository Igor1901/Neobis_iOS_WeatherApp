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
        
    }


}

