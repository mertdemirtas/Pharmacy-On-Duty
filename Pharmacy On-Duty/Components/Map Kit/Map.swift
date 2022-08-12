//
//  Map.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 7.07.2022.
//

import UIKit
import MapKit

class Map: MKMapView {
    private var data: MapViewData?
        
    func setData(coordinationData: MapViewData?) {
        guard let data = coordinationData else { return }
        self.data = data
    }
    
    func drawMap() {
        guard let data = self.data else { return }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        let destinationRegion = MKCoordinateRegion(center: data.destinationLocation ?? CLLocationCoordinate2D(), span: span)
        setRegion(destinationRegion, animated: true)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = data.destinationLocation ?? CLLocationCoordinate2D()
        addAnnotation(destinationPin)
        destinationPin.title = data.pharmacyName
    }
}
