//
//  WeatherCollectionViewCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit
import SnapKit

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
        
        selectedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tempretureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(selectedView.snp.centerX)
            make.top.equalTo(selectedView.snp.top).offset(13)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(selectedView.snp.centerX)
            make.centerY.equalTo(selectedView.snp.centerY)
            make.height.equalTo(90)
            make.width.equalTo(100)
        }
        
        hourLabel.snp.makeConstraints { make in
            make.centerX.equalTo(selectedView.snp.centerX)
            make.bottom.equalTo(selectedView.snp.bottom).offset(-13)
        }
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
