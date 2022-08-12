//
//  PharmacyDetailCardView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

import UIKit

class PharmacyDetailCardView: GenericBaseView<Datum> {
    private lazy var containerView: PharmacyDetailContainerView = {
        let temp = PharmacyDetailContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16.0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        containerView.setData(by: data)
    }
}
