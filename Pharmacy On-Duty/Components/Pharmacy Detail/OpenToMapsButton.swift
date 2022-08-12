//
//  OpenToMapsButton.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 8.08.2022.
//

import Foundation
import UIKit
import MapKit

class OpenToMapsButton: BaseButton<MapViewData> {
    
    private lazy var buttonText: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .white
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 19)
        temp.text = "Haritalar Uygulamasında Aç"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        containerView.backgroundColor = .systemBlue
        addViewOnCenter(view: buttonText)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        self.setButtonAction {
            let coordinate = CLLocationCoordinate2DMake(data.destinationLocation?.latitude ?? 0.0, data.destinationLocation?.longitude ?? 0.0)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
            mapItem.name = data.pharmacyName
            mapItem.openInMaps()
        }
    }
}
