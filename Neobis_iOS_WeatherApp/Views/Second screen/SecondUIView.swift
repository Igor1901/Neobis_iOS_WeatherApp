//
//  SecondUIView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 19/2/24.
//

import UIKit

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
        
        [backButton, backLabel, backImage, settingImage, line1, line2, dateView, firstDateLabel, secondDateLabel,
         collectionView, weekTitleView, weekTitleLabel, calendarImage, scrollViewFill, scrollViewBorder, tableView, weatherConditionView, sunImage, weatherConditionLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
    
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 95),
            backButton.heightAnchor.constraint(equalToConstant: 37),
            
            backLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            backLabel.trailingAnchor.constraint(equalTo: backButton.trailingAnchor),
            
            backImage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            backImage.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            backImage.heightAnchor.constraint(equalToConstant: 17),
            backImage.widthAnchor.constraint(equalToConstant: 11),
            
            settingImage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            settingImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            settingImage.heightAnchor.constraint(equalToConstant: 24),
            settingImage.widthAnchor.constraint(equalToConstant: 24),
            
            
            line1.widthAnchor.constraint(equalToConstant: 112),
            line1.heightAnchor.constraint(equalToConstant: 235),
            line1.topAnchor.constraint(equalTo: topAnchor, constant: 92),
            line1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -25),
            
            line2.widthAnchor.constraint(equalToConstant: 425),
            line2.heightAnchor.constraint(equalToConstant: 366.5),
            line2.topAnchor.constraint(equalTo: topAnchor, constant: -54),
            line2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 70),
            
            
            dateView.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 49),
            dateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            dateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
            
            firstDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            firstDateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor),
            
            secondDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            secondDateLabel.trailingAnchor.constraint(equalTo: dateView.trailingAnchor),
                
            collectionView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 155),
            
            weekTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            weekTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            weekTitleView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            weekTitleView.heightAnchor.constraint(equalToConstant: 37),
            
            weekTitleLabel.centerYAnchor.constraint(equalTo: weekTitleView.centerYAnchor),
            weekTitleLabel.leadingAnchor.constraint(equalTo: weekTitleView.leadingAnchor),
            
            calendarImage.centerYAnchor.constraint(equalTo: weekTitleView.centerYAnchor),
            calendarImage.trailingAnchor.constraint(equalTo: weekTitleView.trailingAnchor),
            calendarImage.heightAnchor.constraint(equalToConstant: 24),
            calendarImage.widthAnchor.constraint(equalToConstant: 24),
            
            scrollViewBorder.topAnchor.constraint(equalTo: calendarImage.bottomAnchor, constant: 44),
            scrollViewBorder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            scrollViewBorder.heightAnchor.constraint(equalToConstant: 294),
            scrollViewBorder.widthAnchor.constraint(equalToConstant: 6),
            
            scrollViewFill.topAnchor.constraint(equalTo: scrollViewBorder.topAnchor),
            scrollViewFill.centerXAnchor.constraint(equalTo: scrollViewBorder.centerXAnchor),
            scrollViewFill.heightAnchor.constraint(equalToConstant: 138),
            scrollViewFill.widthAnchor.constraint(equalToConstant: 6),
            
            tableView.topAnchor.constraint(equalTo: weekTitleView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: scrollViewBorder.leadingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 312),
            
            weatherConditionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherConditionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            weatherConditionView.heightAnchor.constraint(equalToConstant: 28),
            weatherConditionView.widthAnchor.constraint(equalToConstant: 148),
            
            sunImage.leadingAnchor.constraint(equalTo: weatherConditionView.leadingAnchor),
            sunImage.centerYAnchor.constraint(equalTo: weatherConditionView.centerYAnchor),
            sunImage.heightAnchor.constraint(equalToConstant: 24),
            sunImage.widthAnchor.constraint(equalToConstant: 24),
            
            weatherConditionLabel.trailingAnchor.constraint(equalTo: weatherConditionView.trailingAnchor),
            weatherConditionLabel.centerYAnchor.constraint(equalTo: weatherConditionView.centerYAnchor),
        ])
    }
    
}
