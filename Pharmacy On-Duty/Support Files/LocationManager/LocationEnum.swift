//
//  LocationEnum.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 5.07.2022.
//

import CoreLocation

enum LocationEnum {
    case usable
    case unsuable
    
    init(permission: CLAuthorizationStatus) {
        switch permission {
        case .notDetermined:
            self = .unsuable
        case .restricted:
            self = .unsuable
        case .denied:
            self = .unsuable
        case .authorizedAlways:
            self = .usable
        case .authorizedWhenInUse:
            self = .usable
        case .authorized:
            self = .usable
        @unknown default:
            self = .unsuable
        }
    }
}
