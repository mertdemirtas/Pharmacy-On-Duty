//
//  PharmacyListCardView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class PharmacyListCardButton: BaseButton<PharmacyListCardData> {
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.spacing = 10.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var stackViewDistance: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 4.0
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var distanceLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.textColor = .black
        temp.font = UIFont.boldSystemFont(ofSize: 16)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var distanceImage: UIImageView = {
        let temp = UIImageView()
        temp.image = UIImage(systemName: "mappin.and.ellipse")
        temp.tintColor = .systemBlue
        temp.widthAnchor.constraint(equalToConstant: 38.0).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 34.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var pharmacyListCardContainerView: PharmacyListCardContainerView = {
        let temp = PharmacyListCardContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(pharmacyListCardContainerView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -16.0),
            
            distanceLabel.widthAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        pharmacyListCardContainerView.setData(by: PharmacyListCardContainerData(title: data.title, adress: data.adress))
        
        guard let distance = data.distance else { return }
        
        stackView.insertArrangedSubview(stackViewDistance, at: 0)
        stackViewDistance.addArrangedSubview(distanceImage)
        stackViewDistance.addArrangedSubview(distanceLabel)
        distanceLabel.text = String(format: "%.2f", distance) + " km"
    }
}
