//
//  LocationManager.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation

class LocationManager {
    var latitude: String?
    var longitude: String?
    
    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
