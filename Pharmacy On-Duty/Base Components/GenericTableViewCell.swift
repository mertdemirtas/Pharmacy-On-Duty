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
        self.contentView.addSubview(genericView)
    }
    
    override func setupViewConfigurations() {
        NSLayoutConstraint.activate([
            genericView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0),
            genericView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0),
            genericView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0),
            genericView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
    }
    
    func setData(data: Data) {
        genericView.setData(by: data)
    }
}
