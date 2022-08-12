//
//  PharmacyDetailContainerView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class PharmacyDetailContainerView: GenericBaseView<DetailContainerData> {
    // MARK: Constants
    private let spacingValue: CGFloat = 12.0
    
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = spacingValue
        temp.distribution = .fill
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var adressStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var adressLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "Adres"
        temp.numberOfLines = 0
        temp.textColor = .systemRed
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var adress: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textColor = .black
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var phoneNumberStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var phoneNumberLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "Telefon"
        temp.numberOfLines = 0
        temp.textColor = .systemRed
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var phoneNumber: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textColor = .black
        temp.font = .systemFont(ofSize: 17, weight: .regular)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(adressStackView)
        
        adressStackView.addArrangedSubview(adressLabel)
        adressStackView.addArrangedSubview(adress)
        
        stackView.addArrangedSubview(phoneNumberStackView)
        
        phoneNumberStackView.addArrangedSubview(phoneNumberLabel)
        phoneNumberStackView.addArrangedSubview(phoneNumber)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        phoneNumber.text = data.phoneNumber
        adress.text = data.adress
    }
}
