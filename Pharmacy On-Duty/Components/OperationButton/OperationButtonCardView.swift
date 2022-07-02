//
//  OperationButtonCardView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class OperationButtonCardView: BaseButton<OperationButtonData> {
    
    private lazy var operationContainerView: OperationButtonContainerView = {
        let temp = OperationButtonContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        containerView.addSubview(operationContainerView)
        
        NSLayoutConstraint.activate([
            operationContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            operationContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            operationContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            operationContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
    }
    
    override func loadDataView() {
        guard let data = self.returnData() else { return }
        operationContainerView.setData(by: data)
    }
}
