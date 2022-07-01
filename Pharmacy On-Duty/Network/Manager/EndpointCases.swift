//
//  EndpointCases.swift
//  MovieApp-Invio
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import Foundation
import Alamofire

enum EndpointCases: Endpoint {
    case getByLocation(city: String)
    
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
        case .getByLocation(city: let city):
            return "city=\(city)"
        }
    }
    
    var headers: HTTPHeaders? {
        return [.authorization(bearerToken: NetworkConstants.apiToken)]
    }
    
    var body: [String : Any]? {
        switch self {
        case .getByLocation:
            return [:]
        }
    }
}
