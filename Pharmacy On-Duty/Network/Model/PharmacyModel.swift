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
struct PharmacyModel {
    let status, message: String?
    let rowCount: Int?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum {
    let eczaneAdi, adresi, semt, yolTarifi: String?
    let telefon, telefon2, sehir, ilce: String?
    let latitude, longitude: Double?
}
