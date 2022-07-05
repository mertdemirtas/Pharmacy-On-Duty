//
//  ResultPageBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class ResultPageBuilder {
    class func build(city: String, country: String) -> UIViewController {
        let endPoint = EndpointCases.getByManuel(city, country)
        let viewModel = ResultPageViewModel(endPoint: endPoint)
        let viewController = ResultPageViewController(viewModel: viewModel)
        viewController.title = "Nöbetçi Eczane Listesi"
        return viewController
    }
}
