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
    var status, message: String?
    var systemTime, rowCount: Int?
    var data: [DistanceData]?
}

// MARK: - DistanceData
struct DistanceData: Codable {
    var eczaneAdi, adresi, semt, yolTarifi: String?
    var telefon, telefon2: String?
    var sehir: String?
    var ilce: String?
    var latitude, longitude: Double?
    var distanceMT: Int?
    var distanceKM, distanceMil: Double?

    enum CodingKeys: String, CodingKey {
        case eczaneAdi = "EczaneAdi"
        case adresi = "Adresi"
        case semt = "Semt"
        case yolTarifi = "YolTarifi"
        case telefon = "Telefon"
        case telefon2 = "Telefon2"
        case sehir = "Sehir"
        case ilce, latitude, longitude
        case distanceMT = "distanceMt"
        case distanceKM = "distanceKm"
        case distanceMil
    }
}
