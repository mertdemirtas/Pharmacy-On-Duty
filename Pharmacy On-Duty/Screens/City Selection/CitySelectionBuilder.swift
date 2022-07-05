//
//  CitySelectionBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit

class CitySelectionBuilder {
    class func build() -> UIViewController {
        let viewModel = CitySelectionViewModel()
        let viewController = CitySelectionViewController(viewModel: viewModel)
        viewController.title = "İl Seçimi"
        return viewController
    }
}
