//
//  LocationEnum.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 5.07.2022.
//

import CoreLocation

enum LocationEnum {
    case usable
    case notDetermined
    case unusable
    
    init(permission: CLAuthorizationStatus) {
        switch permission {
        case .notDetermined:
            self = .notDetermined
        case .restricted:
            self = .unusable
        case .denied:
            self = .unusable
        case .authorizedAlways:
            self = .usable
        case .authorizedWhenInUse:
            self = .usable
        case .authorized:
            self = .usable
        @unknown default:
            self = .unusable
        }
    }
}
