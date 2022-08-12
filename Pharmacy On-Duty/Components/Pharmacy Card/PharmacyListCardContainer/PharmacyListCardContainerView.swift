//
//  PharmacyListCardContainerView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation
import UIKit

class PharmacyListCardContainerView: GenericBaseView<PharmacyListCardContainerData> {
    // MARK: Constants
    private let spacingValue: CGFloat = 10
    
    // MARK: Components
    private lazy var pharmacyDetailStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = spacingValue
        temp.alignment = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var title: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textColor = .systemRed
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var adress: BaseLabel = {
        let temp = BaseLabel()
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textColor = .black
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(pharmacyDetailStackView)
        
        pharmacyDetailStackView.addArrangedSubview(title)
        pharmacyDetailStackView.addArrangedSubview(adress)
        
        NSLayoutConstraint.activate([
            pharmacyDetailStackView.topAnchor.constraint(equalTo: topAnchor),
            pharmacyDetailStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pharmacyDetailStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pharmacyDetailStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        title.text = data.title
        adress.text = data.adress
    }
}
