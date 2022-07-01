//
//  NetworkManager.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 16.04.2022.
//

import Alamofire
import Foundation
import RxSwift

class NetworkManager {
    
    public func request<T: Codable>(from endPoint: Endpoint, completionHandler: @escaping (Result<T, Error>) -> Void) {
        // MARK: URL
        let urlString = endPoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString ?? "")!
        var urlRequest = URLRequest(url: url)
        
        // MARK: HTTP Method
        urlRequest.httpMethod = endPoint.httpMethod
        
        AF.request(urlRequest).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
