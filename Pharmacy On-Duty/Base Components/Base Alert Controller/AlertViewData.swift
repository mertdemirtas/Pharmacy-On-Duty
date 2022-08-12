//
//  AlertViewData.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 9.08.2022.
//

import Foundation

struct AlertViewData {
    let alertTitle: String?
    let alertDetailText: String?
    let buttonTitle: String?
    let buttonAction: () -> ()
}
