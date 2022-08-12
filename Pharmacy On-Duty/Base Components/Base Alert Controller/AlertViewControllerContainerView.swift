//
//  AlertView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 9.08.2022.
//

import Foundation
import UIKit

class AlertViewControllerContainerView: GenericBaseView<AlertViewData> {
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()

    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()

    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.spacing = 10
        temp.axis = .vertical
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var alertTitle: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.textColor = .systemRed
        temp.font = UIFont.boldSystemFont(ofSize: 23)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var detailText: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textColor = .darkGray
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 20
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var cancelButton: BaseButton<GenericDataProtocol> = {
        let temp = BaseButton<GenericDataProtocol>()
        temp.buttonLabel.text = "Kapat"
        temp.buttonLabel.textColor = .black
        temp.addViewOnCenter(view: temp.buttonLabel)
        temp.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var secondButton : BaseButton<GenericDataProtocol> = {
        let temp = BaseButton<GenericDataProtocol>()
        temp.addViewOnCenter(view: temp.buttonLabel)
        temp.buttonLabel.textColor = .systemBlue
        temp.buttonLabel.font = UIFont.boldSystemFont(ofSize: 17)
        temp.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private func prepareShadowView() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)

        NSLayoutConstraint.activate([

            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor)
        ])
    }
    
    
    override func addMajorViewComponents() {
        prepareShadowView()
        containerView.backgroundColor = .white
        containerView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0)
        ])
        
        containerStackView.addArrangedSubview(alertTitle)
        containerStackView.addArrangedSubview(detailText)
        
        containerStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(secondButton)
        
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        alertTitle.text = data.alertTitle
        detailText.text = data.alertDetailText
        secondButton.buttonLabel.text = data.buttonTitle
        secondButton.setButtonAction(action: data.buttonAction)
    }
}
