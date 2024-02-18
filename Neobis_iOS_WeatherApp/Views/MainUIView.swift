//
//  MainUIView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 14/2/24.
//

import UIKit
import SnapKit

class MainUIView: UIView {

    let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    let line1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let line2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line2")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pointImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let сityLabel: UILabel = {
        let label = UILabel()
        label.text = "Бишкек"
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        return label
    }()
    
    let downArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowDown")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cityView: UIView = UIView()

    let notificationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "notification")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let sunImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.3)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня, 26 Апрель"
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.addBigShadow()
        label.font = UIFont(name: "Overpass-Regular", size: 100)
        label.textColor = .white
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let infoView: UIView = UIView()
    
    let windImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wind")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    let rainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rain")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    
    let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветер |  15 km/h"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let rainLabel: UILabel = {
        let label = UILabel()
        label.text = "Дождь | 26 %"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let weatherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -3, height: 5)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 6
        return button
    }()
    
    let buttonLable:UILabel = {
        let label = UILabel()
        label.text = "Прогноз на неделю"
        label.font = UIFont(name: "Overpass-Regular", size: 16)
        label.textColor = .black
        return label
    }()
    
    let arrowTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.up")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds // установка размеров градиента после установки размеров представления
    }

    func setupGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red: 71 / 255, green: 191 / 255, blue: 223 / 255, alpha: 1).cgColor, UIColor(red: 74 / 255, green: 145 / 255, blue: 255 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupConstraints(){
        addSubview(line1)
        addSubview(line2)
        addSubview(cityView)
        cityView.addSubview(pointImage)
        cityView.addSubview(сityLabel)
        cityView.addSubview(downArrow)
        addSubview(notificationImage)
        addSubview(sunImage)
        addSubview(contentView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoView)
        infoView.addSubview(windImage)
        infoView.addSubview(rainImage)
        infoView.addSubview(windLabel)
        infoView.addSubview(rainLabel)
        
        addSubview(weatherButton)
        weatherButton.addSubview(buttonLable)
        weatherButton.addSubview(arrowTop)
        
        line1.snp.makeConstraints { make in
            make.width.equalTo(112)
            make.height.equalTo(235)
            make.top.equalToSuperview().offset(92) // отступ от верхнего края
            make.left.equalToSuperview().offset(-25)
        }
        
        line2.snp.makeConstraints { make in
            make.width.equalTo(425)
            make.height.equalTo(366.5)
            make.top.equalToSuperview().offset(-54) // отступ от верхнего края
            make.right.equalToSuperview().offset(70)
        }
        
        cityView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(52)
            make.leading.equalToSuperview().offset(31)
            make.width.equalTo(197)
            make.height.equalTo(37)
        }

        pointImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
            make.leading.equalTo(cityView.snp.leading)
            make.centerY.equalTo(cityView.snp.centerY)
        }

        сityLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cityView.snp.centerY)
            make.centerX.equalTo(cityView.snp.centerX)
        }

        downArrow.snp.makeConstraints { make in
            make.width.equalTo(9)
            make.height.equalTo(6)
            make.centerY.equalTo(cityView.snp.centerY)
            make.trailing.equalTo(cityView.snp.trailing)
        }

        notificationImage.snp.makeConstraints { make in
            make.width.equalTo(26)
            make.height.equalTo(24)
            make.centerY.equalTo(cityView.snp.centerY)
            make.trailing.equalToSuperview().offset(-30)
        }

        sunImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.centerX.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.top.equalTo(sunImage.snp.bottom).offset(-15)
            make.centerX.equalToSuperview()
            make.width.equalTo(353)
            make.height.equalTo(335)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(17)
            make.centerX.equalTo(contentView.snp.centerX)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.centerX.equalTo(contentView.snp.centerX).offset(15)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(-10)
            make.centerX.equalTo(contentView.snp.centerX).offset(2)
        }

        infoView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalTo(198)
            make.height.equalTo(72)
            make.centerX.equalTo(contentView.snp.centerX)
        }

        windImage.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(2)
            make.leading.equalTo(infoView.snp.leading).offset(2)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        rainImage.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.bottom).offset(2)
            make.leading.equalTo(infoView.snp.leading).offset(2)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        windLabel.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(2)
            make.leading.equalTo(windImage.snp.trailing).offset(20)
        }

        rainLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.bottom).offset(2)
            make.leading.equalTo(rainImage.snp.trailing).offset(20)
        }

        weatherButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(249)
            make.height.equalTo(64)
        }

        buttonLable.snp.makeConstraints { make in
            make.centerY.equalTo(weatherButton.snp.centerY)
            make.leading.equalTo(weatherButton.snp.leading).offset(28)
        }

        arrowTop.snp.makeConstraints { make in
            make.centerY.equalTo(weatherButton.snp.centerY)
            make.trailing.equalTo(weatherButton.snp.trailing).offset(-23)
        }

    }
    /*
    func fillData(with data: Weather) {
        
        let temperatureInC = Int(data.main.temp - 273.15)
        
        сityLabel.text = data.name
        temperatureLabel.text = "\(temperatureInC)°C"
        //countryLabel.text = "\(data.sys.country)"
        windLabel.text = "\(data.wind.speed) m/s"
        //visibility1.text = "\(data.visibility) meters"
        rainLabel.text = "\(data.main.humidity)%"
        //airPressure1.text = "\(data.main.pressure) hPa"
    }
    */
    
}
