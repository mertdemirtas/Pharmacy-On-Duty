//
//  GenericTableViewCell.swift
//  MovieApp-Invio
//
//  Created by Mert Demirtaş on 24.06.2022.
//

import UIKit

class GenericTableViewCell<Data, View: GenericBaseView<Data>>: BaseTableViewCell {
    
    var genericView: View = {
        let temp = View()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(genericView)
    }
    
    override func setupViewConfigurations() {
        NSLayoutConstraint.activate([
            genericView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            genericView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            genericView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            genericView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0)
        ])
    }
    
    func setData(data: Data) {
        genericView.setData(by: data)
    }
}
