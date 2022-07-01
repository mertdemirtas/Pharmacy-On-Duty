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
        let viewModel = MainPageViewModel()
        let viewController = MainPageViewController(viewModel: viewModel)
        viewController.title = "Ana Ekran"
        return viewController
    }
}
