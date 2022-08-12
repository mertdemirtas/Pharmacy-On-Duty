//
//  ResultPageLocationBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit
import CoreLocation

class ResultPageBuilder {
    class func buildWithCurrentLocation(currentLocation: CLLocationCoordinate2D) -> UIViewController {
        let viewModel = ResultPageViewModel(endPoint: EndpointCases.getByLocation(currentLocation: currentLocation))
        let viewController = ResultPageViewController(viewModel: viewModel)
        viewController.title = "Yakınımdaki Nöbetçi Eczaneler"
        return viewController
    }
    
    class func buildWithCityAndCountry(city: String, country: String) -> UIViewController {
        let viewModel = ResultPageViewModel(endPoint: EndpointCases.getByManuel(city: city, country: country))
        let viewController = ResultPageViewController(viewModel: viewModel)
        viewController.title = country.firstUppercased
        return viewController
    }
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
