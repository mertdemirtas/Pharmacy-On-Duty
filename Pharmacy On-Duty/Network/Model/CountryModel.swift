//
//  CountryModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable {
    var status, message: String?
    var systemTime, rowCount: Int?
    var data: [CountryParameters]?
}

// MARK: - CountryParameters
struct CountryParameters: Codable {
    var ilceAd, ilceSlug: String?
}
