//
//  CityCardView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit

class CityCardViewButton: BaseButton<CityData> {
    // MARK: Components
    private lazy var cityName: BaseLabel = {
        let temp = BaseLabel()
        temp.font = UIFont.boldSystemFont(ofSize: 24)
        temp.textAlignment = .center
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        containerView.addSubview(cityName)
        
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            cityName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            cityName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cityName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        cityName.text = data.name
    }
}
