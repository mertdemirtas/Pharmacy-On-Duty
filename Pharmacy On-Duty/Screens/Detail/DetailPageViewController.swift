//
//  DetailPageViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

import UIKit
import MapKit

class DetailPageViewController: BaseViewController<DetailPageViewModel> {
    // MARK: Components
    private lazy var cardView: PharmacyDetailCardView = {
        let temp = PharmacyDetailCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = viewModel.getData()
        cardView.setData(by: data)
    }
    
    // MARK: Override Methods
    override func addViewComponents() {
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            cardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0)
        ])
    }
    
}
