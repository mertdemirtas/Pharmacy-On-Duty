//
//  EmptyResultCellContainerView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 11.08.2022.
//

import Foundation
import UIKit

class EmptyResultCellContainerView: BaseView {
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 4
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var titleLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "Eczane Bulunamadı!"
        temp.textColor = .systemRed
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 26)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var detailLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.text = "Seçtiğiniz konumda nöbetçi eczane bulunamamıştır."
        temp.font = UIFont.systemFont(ofSize: 21)
        temp.textAlignment = .center
        temp.textColor = .darkGray
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
    }
}
