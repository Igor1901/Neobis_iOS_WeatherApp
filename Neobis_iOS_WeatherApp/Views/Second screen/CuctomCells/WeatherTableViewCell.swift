//
//  WeatherTableViewCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Игорь Пачкин on 18/2/24.
//

import UIKit

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
        
        [dateLabel, tempLabel, imgView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            imgView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 70),
            imgView.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func configure(image: String, dateText: String, tempText: String) {
        dateLabel.text = dateText
        tempLabel.text = tempText
        imgView.image = UIImage(named: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
