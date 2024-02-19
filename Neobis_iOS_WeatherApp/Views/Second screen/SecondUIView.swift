//
//  SecondUIView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 19/2/24.
//

import UIKit
import SnapKit

class SecondUIView: UIView {

    let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let backLabel: UILabel = {
        let label = UILabel()
        label.text = "Назад"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .bold))
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    let settingImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "settigns")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
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
    
    
    let firstDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let secondDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Апр, 26"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let dateView: UIView = UIView()
    
    let weekTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "На этой неделе"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "calendar"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
    }()
    
    
    
    //MARK: CollectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width * 70 / 414.0), height: 155)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear  //WeatherCollectionViewCell
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let weekTitleView: UIView = UIView()
    
    let scrollViewBorder: UIView = {
        let scrollView = UIView()
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.cornerRadius = 5
        return scrollView
    }()
    
    let scrollViewFill: UIView = {
        let scrollView = UIView()
        scrollView.backgroundColor = .white
        scrollView.layer.cornerRadius = 5
        return scrollView
    }()
    
    let tableView: UITableView = {
        let  tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
        return tableView
    }()
    
     let weatherConditionView: UIView = UIView()
    
     let sunImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "whiteSun"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
    }()
    
     let weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "AccuWeather"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        return label
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
    
    func setupConstraints() {
        addSubview(backButton)
        backButton.addSubview(backLabel)
        backButton.addSubview(backImage)
        addSubview(settingImage)
        
        addSubview(line1)
        addSubview(line2)
        
        addSubview(dateView)
        dateView.addSubview(firstDateLabel)
        dateView.addSubview(secondDateLabel)
        addSubview(collectionView)
        addSubview(weekTitleView)
        weekTitleView.addSubview(weekTitleLabel)
        weekTitleView.addSubview(calendarImage)
        addSubview(scrollViewBorder)
        scrollViewBorder.addSubview(scrollViewFill)
        addSubview(tableView)
        addSubview(weatherConditionView)
        weatherConditionView.addSubview(sunImage)
        weatherConditionView.addSubview(weatherConditionLabel)
        
        
    
        backButton.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(52)
            make.leading.equalTo(snp.leading).offset(32)
            make.width.equalTo(95)
            make.height.equalTo(37)
        }

        backLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.trailing.equalTo(backButton.snp.trailing)
        }

        backImage.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.leading)
            make.height.equalTo(17)
            make.width.equalTo(11)
        }

        settingImage.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-30)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }

        line1.snp.makeConstraints { make in
            make.width.equalTo(112)
            make.height.equalTo(235)
            make.top.equalTo(snp.top).offset(92)
            make.leading.equalTo(snp.leading).offset(-25)
        }

        line2.snp.makeConstraints { make in
            make.width.equalTo(425)
            make.height.equalTo(366.5)
            make.top.equalTo(snp.top).offset(-54)
            make.trailing.equalTo(snp.trailing).offset(70)
        }

        dateView.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(49)
            make.leading.equalTo(snp.leading).offset(30)
            make.trailing.equalTo(snp.trailing).offset(-23)
        }

        firstDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateView.snp.centerY)
            make.leading.equalTo(dateView.snp.leading)
        }

        secondDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateView.snp.centerY)
            make.trailing.equalTo(dateView.snp.trailing)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).offset(32)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(155)
        }

        weekTitleView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(30)
            make.trailing.equalTo(snp.trailing).offset(-30)
            make.top.equalTo(collectionView.snp.bottom).offset(50)
            make.height.equalTo(37)
        }

        weekTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(weekTitleView.snp.centerY)
            make.leading.equalTo(weekTitleView.snp.leading)
        }

        calendarImage.snp.makeConstraints { make in
            make.centerY.equalTo(weekTitleView.snp.centerY)
            make.trailing.equalTo(weekTitleView.snp.trailing)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }

        scrollViewBorder.snp.makeConstraints { make in
            make.top.equalTo(calendarImage.snp.bottom).offset(44)
            make.trailing.equalTo(snp.trailing).offset(-30)
            make.height.equalTo(294)
            make.width.equalTo(6)
        }

        scrollViewFill.snp.makeConstraints { make in
            make.top.equalTo(scrollViewBorder.snp.top)
            make.centerX.equalTo(scrollViewBorder.snp.centerX)
            make.height.equalTo(138)
            make.width.equalTo(6)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(weekTitleView.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(30)
            make.trailing.equalTo(scrollViewBorder.snp.leading).offset(-20)
            make.height.equalTo(312)
        }

        weatherConditionView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.bottom.equalTo(snp.bottom).offset(-28)
            make.height.equalTo(28)
            make.width.equalTo(148)
        }

        sunImage.snp.makeConstraints { make in
            make.leading.equalTo(weatherConditionView.snp.leading)
            make.centerY.equalTo(weatherConditionView.snp.centerY)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }

        weatherConditionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(weatherConditionView.snp.trailing)
            make.centerY.equalTo(weatherConditionView.snp.centerY)
        }

    }
    
}
