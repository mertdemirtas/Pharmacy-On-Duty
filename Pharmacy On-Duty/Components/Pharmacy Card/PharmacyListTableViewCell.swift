//
//  PharmacyListTableViewCell.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

import UIKit

class PharmacyListTableViewCell: GenericTableViewCell<PharmacyListCardData,PharmacyListCardButton> {
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = .zero
    }
}
