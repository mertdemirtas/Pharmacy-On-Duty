//
//  PharmacyListCardData.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import MapKit

struct PharmacyListCardData {
    let title: String?
    let adress: String?
    let destinationLocation: CLLocationCoordinate2D?
    let distance: Double?
}

struct Locations {
    let sourceLocation: CLLocationCoordinate2D?
    let destinationLocation: CLLocationCoordinate2D?
}
