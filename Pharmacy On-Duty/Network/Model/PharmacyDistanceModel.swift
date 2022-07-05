//
//  PharmacyDistanceModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pharmacyModel = try? newJSONDecoder().decode(PharmacyModel.self, from: jsonData)

import Foundation

// MARK: - PharmacyDistanceModel
struct PharmacyDistanceModel: Codable {
    let status, message: String?
    let systemTime, rowCount: Int?
    let data: [DistanceData]?
}

// MARK: - DistanceData
struct DistanceData: Codable {
    let eczaneAdi, adresi, semt: String?
    let yolTarifi: String?
    let telefon: String?
    let telefon2: String?
    let sehir: String?
    let ilce: String?
    let latitude, longitude: Double?
    let distanceMT: Int?
    let distanceKM, distanceMil: Double?
}
