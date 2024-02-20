//
//  WeatherTableViewCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {
    // Define your custom UI components here
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Overpass-Bold", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.backgroundColor = UIColor.clear.cgColor
        selectionStyle = .none
        backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(imgView)
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        imgView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(70)
            make.width.equalTo(80)
        }
    }
    
    func configureData(weekDay: String, image: String, temp: String) {
        self.dateLabel.text = weekDay
        imgView.image = UIImage(named: image)
        tempLabel.text = temp
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
