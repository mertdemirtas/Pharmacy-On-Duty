//
//  EndpointCases.swift
//  MovieApp-Invio
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import Foundation
import Alamofire
import CoreLocation

enum EndpointCases: Endpoint {
    case getByLocation(currentLocation: CLLocationCoordinate2D)
    case getByManuel(city: String, country: String)
    case getCountryList(String)
    case getCities
    
    var apiKey: String {
        return ""
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    var baseURLString: String {
        return NetworkConstants.apiURL
    }
    
    var path: String {
        switch self {
        case .getByLocation(let currentLocation):
            return "/distance?latitude=\(currentLocation.latitude)&longitude=\(currentLocation.longitude)"
            
        case .getByManuel(let city, let country):
            return "?city=\(city)&county=\(country)"
            
        case .getCountryList(let city):
            return "/city?city=\(city)"
        
        case .getCities:
            return "/city?"
        }
    }
    
    var headers: HTTPHeaders? {
        return [.authorization(bearerToken: NetworkConstants.apiToken)]
    }
    
    var body: [String : Any]? {
        return [:]
    }
}
