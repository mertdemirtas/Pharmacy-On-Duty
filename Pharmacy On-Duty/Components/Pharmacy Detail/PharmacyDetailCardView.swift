//
//  PharmacyDetailCardView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

import UIKit
import MapKit

class PharmacyDetailCardView: GenericBaseView<ResultPageData> {
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 20
        temp.axis = .vertical
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var containerView: PharmacyDetailContainerView = {
        let temp = PharmacyDetailContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var mapView: Map = {
        let temp = Map()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var openToMapsButton: OpenToMapsButton = {
        let temp = OpenToMapsButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(containerView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        containerView.setData(by: DetailContainerData(eczaneName: data.title, phoneNumber: data.phoneNumber, adress: data.adress))
        
        guard let destinationLocation = data.destinationLocation else { return }
        
        stackView.addArrangedSubview(mapView)
        
        let locationData = MapViewData(pharmacyName: data.title, destinationLocation: destinationLocation)
        mapView.setData(coordinationData: locationData)
        mapView.drawMap()
        
        openToMapsButton.setData(by: locationData)
        stackView.addArrangedSubview(openToMapsButton)
    }
}
