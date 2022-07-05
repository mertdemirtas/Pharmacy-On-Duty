//
//  ResultPageLocationBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit

class ResultPageLocationBuilder {
    class func build() -> UIViewController {
        let viewModel = ResultPageLocationViewModel()
        let viewController = ResultPageLocationViewController(viewModel: viewModel)
        viewController.title = "Nöbetci Eczane Listesi"
        return viewController
    }
}
