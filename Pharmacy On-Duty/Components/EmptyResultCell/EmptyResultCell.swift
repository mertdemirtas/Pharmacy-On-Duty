//
//  EmptyResultCell.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 11.08.2022.
//

import Foundation
import UIKit

class EmptyResultCell: BaseTableViewCell {
    private lazy var containerView: EmptyResultCellContainerView = {
        let temp = EmptyResultCellContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        self.contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0),
        ])
    }
}
