//
//  CustomAlertViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 10.08.2022.
//

import Foundation
import UIKit

class BaseTwoButtonAlertViewController: UIViewController {
    
    private var data : AlertViewData!
    
    // MARK: Constants
    private let alertViewHeight: CGFloat = 200.0
    private let alertViewWidth: CGFloat = 300.0
    
    // MARK: UI Components
    private lazy var alertView: AlertViewControllerContainerView = {
        let temp = AlertViewControllerContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .overCurrentContext
        prepareUI()
        addMajorViewComponents()
        setupViewConfigurations()
    }
    
    private func prepareUI() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        prepareCancelButtonAction()
        
        view.addSubview(alertView)
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: alertViewHeight).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: alertViewWidth).isActive = true
    }
    
    private func prepareCancelButtonAction() {
        alertView.cancelButton.setButtonAction { [weak self] in
            self?.dismiss(animated: false, completion: nil)
        }
    }
    
    func setData(by value: AlertViewData?) {
        self.data = value
        alertView.setData(by: data)
        loadDataView()
    }
    
    func loadDataView() { }
    
    func addMajorViewComponents() { }
    
    func setupViewConfigurations() { }
}
