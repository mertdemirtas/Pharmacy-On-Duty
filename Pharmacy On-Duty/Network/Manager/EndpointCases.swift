//
//  EndpointCases.swift
//  MovieApp-Invio
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import Foundation
import Alamofire

enum EndpointCases: Endpoint {
    case getByLocation(String, String)
    case getByManuel(String, String)
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
        case .getByLocation(let latitude, let longitude):
            return "/distance?latitude=\(latitude)&longitude=\(longitude)"
            
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
