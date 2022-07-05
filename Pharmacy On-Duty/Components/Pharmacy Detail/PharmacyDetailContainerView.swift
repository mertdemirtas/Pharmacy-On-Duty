//
//  PharmacyDetailContainerView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class PharmacyDetailContainerView: GenericBaseView<Datum> {
    // MARK: Constants
    private let spacingValue: CGFloat = 8.0
    
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = spacingValue
        temp.distribution = .fill
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var adress: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textColor = .black
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var district: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.font = UIFont.boldSystemFont(ofSize: 22)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var directions: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var phoneNumber: UITextView = {
        let temp = UITextView()
        temp.textContainer.maximumNumberOfLines = 1
        temp.backgroundColor = .clear
        temp.isEditable = false
        temp.textAlignment = .left
        temp.textColor = .black
        temp.isScrollEnabled = false
        temp.textInputView.contentMode = .left
        temp.font = UIFont.boldSystemFont(ofSize: 21)
        temp.dataDetectorTypes = .phoneNumber
        temp.textInputView.translatesAutoresizingMaskIntoConstraints = false
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var city: BaseLabel = {
        let temp = BaseLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var country: BaseLabel = {
        let temp = BaseLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(district)
        stackView.addArrangedSubview(phoneNumber)
        stackView.addArrangedSubview(adress)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        district.text = "Semt:"
        district.addText(text: data.semt ?? "")
        
        phoneNumber.text = "Telefon: " + "\(data.telefon ?? "")" + ", " + "\(data.telefon ?? "")"
//        phoneNumber.addText(text: data.telefon ?? "")
//        phoneNumber.addText(text: data.telefon2 ?? "")
        
        adress.text = "Adres:"
        adress.addText(text: data.adresi ?? "")
    }

}
