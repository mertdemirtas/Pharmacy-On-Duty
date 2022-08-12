//
//  ResultPageLocationDataFormatter.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 9.08.2022.
//

import Foundation
import CoreLocation

class ResultPageDataFormatter {
    
    class func formatToResultPageData(data: DistanceData?, sourceLocation: CLLocationCoordinate2D?, destinationLocation: CLLocationCoordinate2D?) -> ResultPageData {
        //let destinationLocation = CLLocationCoordinate2D(latitude: data?.latitude ?? 0.0, longitude: data?.longitude ?? 0.0)
        let convertedData = ResultPageData(title: data?.eczaneAdi, adress: data?.adresi, destinationLocation: destinationLocation, distance: data?.distanceKM, phoneNumber: data?.telefon)
        
        return convertedData
    }
    
    class func formatToPharmacyListCardData(data: ResultPageData?) -> PharmacyListCardData {
        let convertedData = PharmacyListCardData(title: data?.title, adress: data?.adress, destinationLocation: data?.destinationLocation,  distance: data?.distance)
        return convertedData
    }
    
}

