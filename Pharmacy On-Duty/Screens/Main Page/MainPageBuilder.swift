//
//  MainPageBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation
import UIKit

class MainPageBuilder {
    class func build() -> UIViewController {
        let locationManager = LocationManager()
        let viewModel = MainPageViewModel(locationManager: locationManager)
        let viewController = MainPageViewController(viewModel: viewModel)
        viewController.title = "Nöbetçi Eczane"
        return viewController
    }
}
