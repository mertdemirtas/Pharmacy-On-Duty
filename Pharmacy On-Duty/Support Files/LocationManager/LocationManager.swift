//
//  LocationManager.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation
import CoreLocation

class LocationManager: CLLocationManager {
    private var status: LocationEnum?
    
    public func controlLocationPermission(completionHandler: (LocationEnum) -> Void) {
        status = LocationEnum.init(permission: authorizationStatus)
        
        switch status {
        case .unsuable:
            requestWhenInUseAuthorization()
            status = LocationEnum.init(permission: authorizationStatus)
            completionHandler(status ?? .unsuable)
            
        case .usable:
            completionHandler(status ?? .usable)
            
        case .none:
            requestWhenInUseAuthorization()
            status = LocationEnum.init(permission: authorizationStatus)
            completionHandler(status ?? .unsuable)
        }
    }
    
    public func getStatus() -> LocationEnum {
        return status ?? .unsuable
    }
    
    public func getLocation() -> CLLocation {
        guard let location = location else { return CLLocation() }
        return location
    }
}


 
