//
//  ResultPageData.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 9.08.2022.
//

import Foundation
import CoreLocation

struct ResultPageData {
    let title: String?
    let adress: String?
    let destinationLocation: CLLocationCoordinate2D?
    let distance: Double?
    let phoneNumber: String?
}
