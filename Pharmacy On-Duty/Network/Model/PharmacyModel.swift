//
//  PharmacyModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pharmacyModel = try? newJSONDecoder().decode(PharmacyModel.self, from: jsonData)

import Foundation

// MARK: - PharmacyModel
struct PharmacyModel: Codable {
    var status, message: String?
    var rowCount: Int?
    var data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    var eczaneAdi, adresi, semt, yolTarifi: String?
    var telefon, telefon2, sehir, ilce: String?
    var latitude, longitude: Double?

    enum CodingKeys: String, CodingKey {
        case eczaneAdi = "EczaneAdi"
        case adresi = "Adresi"
        case semt = "Semt"
        case yolTarifi = "YolTarifi"
        case telefon = "Telefon"
        case telefon2 = "Telefon2"
        case sehir = "Sehir"
        case ilce, latitude, longitude
    }
}
