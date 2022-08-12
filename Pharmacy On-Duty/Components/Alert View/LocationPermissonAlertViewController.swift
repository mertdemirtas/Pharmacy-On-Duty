//
//  CustomLocationPermissionAlertView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 10.08.2022.
//

import Foundation
import UIKit

class LocationPermissonAlertViewController: BaseTwoButtonAlertViewController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViewConfigurations() {
        
        let buttonAction = {
            if let bundleId = Bundle.main.bundleIdentifier,
               let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") {
                UIApplication.shared.open(url, options: [:], completionHandler: { [weak self] _ in
                    self?.dismiss(animated: false)
                })
            }
        }
        
        let alertViewControllerData = AlertViewData(alertTitle: "Konum Ayarlanmadı", alertDetailText: "Bu özelliği kullanabilmeniz için Konum Servislerini açmanız gerekmektedir.", buttonTitle: "Ayarlar'a Git", buttonAction: buttonAction)
        
        setData(by: alertViewControllerData)
    }
}
