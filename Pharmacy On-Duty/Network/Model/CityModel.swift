//
//  CityModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import Foundation

// MARK: - CityModel
struct CityModel: Codable {
    var status, message: String?
    var systemTime, rowCount: Int?
    var data: [CityParameters]?
}

// MARK: - CityParameters
struct CityParameters: Codable {
    var sehirAd, sehirSlug: String?

    enum CodingKeys: String, CodingKey {
        case sehirAd = "SehirAd"
        case sehirSlug = "SehirSlug"
    }
}
