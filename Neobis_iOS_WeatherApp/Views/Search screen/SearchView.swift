//
//  SearchView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by iPak Tulane on 29/11/23.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    let closeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    
    lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 5
        searchView.layer.borderWidth = 0.5
        searchView.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor
        searchView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        searchView.layer.shadowOpacity = 1
        searchView.layer.shadowRadius = 3
        searchView.layer.shadowOffset = CGSize(width: 0, height: 1)
        return searchView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Куда хотите поехать?"
        textField.attributedPlaceholder = NSAttributedString(string: "Куда хотите поехать?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 48/255, green: 162/255, blue: 197/255, alpha: 1.0).cgColor,
            UIColor(red: 0/255, green: 36/255, blue: 47/255, alpha: 1.0).cgColor
        ]
        layer.addSublayer(gradientLayer)
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        backgroundView.addSubview(closeButton)
        addSubview(backgroundView)
        addSubview(searchView)
        searchView.addSubview(textField)
        searchView.addSubview(searchButton)
    }
    
    func setupConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.topMargin).offset(22)
            make.trailing.equalTo(backgroundView.snp.trailingMargin).offset(-17)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.top).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(40)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(125)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalTo(searchButton.snp.leading)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(15)
            make.height.equalTo(16.31)
        }
        
    }
}
