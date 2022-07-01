//
//  Endpoint.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 20.04.2022.
//

import Foundation
import Alamofire

protocol Endpoint {
    var apiKey: String { get }
    var httpMethod: String { get }
    var baseURLString: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    // a default extension that creates the full URL
    var url: String {
        return baseURLString + path
    }
}
