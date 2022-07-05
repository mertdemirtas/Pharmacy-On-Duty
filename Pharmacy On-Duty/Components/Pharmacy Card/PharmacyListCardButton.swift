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
    
    private lazy var distance: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.textColor = .systemGreen
        temp.font = UIFont.boldSystemFont(ofSize: 15)
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
        
        stackView.addArrangedSubview(distance)
        stackView.addArrangedSubview(pharmacyListCardContainerView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -10.0),
            
            distance.widthAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        _ = (data.distance?.isEmpty ?? true) ? (distance.isHidden = true) : (distance.text = data.distance)
        pharmacyListCardContainerView.setData(by: PharmacyListCardContainerData(title: data.title, adress: data.adress))
    }
}
