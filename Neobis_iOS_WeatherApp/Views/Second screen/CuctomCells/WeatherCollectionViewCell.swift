//
//  WeatherCollectionViewCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var tempretureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var selectedView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        selectedView.addSubview(tempretureLabel)
        selectedView.addSubview(imageView)
        selectedView.addSubview(hourLabel)
        contentView.addSubview(selectedView)
        [imageView, tempretureLabel, hourLabel, selectedView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            selectedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            selectedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            tempretureLabel.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor),
            tempretureLabel.topAnchor.constraint(equalTo: selectedView.topAnchor, constant: 13),
            
            imageView.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: selectedView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            hourLabel.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor),
            hourLabel.bottomAnchor.constraint(equalTo: selectedView.bottomAnchor, constant: -13),
        ])
    }
    
    func configure(image: String, tempText: String, hourText: String,showBorder: Bool) {
        imageView.image = UIImage(named: image)
        tempretureLabel.text = tempText
        hourLabel.text = hourText
        
        if showBorder {
            selectedView.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.3)
            selectedView.layer.cornerRadius = 20
            selectedView.layer.borderWidth = 1
            selectedView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
