//
//  MainPageViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class MainPageViewController: BaseViewController<MainPageViewModel> {
    // MARK: Constants
    private let spacingValue: CGFloat = 64.0
    
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.alignment = .fill
        temp.spacing = spacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var operationButtonByLocation: OperationButtonCardButton = {
        let temp = OperationButtonCardButton()
        temp.setData(by: OperationButtonData(image: "location", titleText: "Şu Anki Konumuma Göre Ara"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setButtonAction {
         //   self.navigationController?.pushViewController(ResultPageBuilder.build(), animated: true)
        }
        return temp
    }()
    
    private lazy var operationButtonByCountry: OperationButtonCardButton = {
        let temp = OperationButtonCardButton()
        temp.setData(by: OperationButtonData(image: "eczane", titleText: "İl - İlçe Bilgisine Göre Ara"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setButtonAction {
            self.navigationController?.pushViewController(CitySelectionBuilder.build(), animated: true)
        }
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Override Methods
    override func addViewComponents() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(operationButtonByLocation)
        stackView.addArrangedSubview(operationButtonByCountry)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
