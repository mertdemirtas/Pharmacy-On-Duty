//
//  CountrySelectionBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit

class CountrySelectionBuilder {
    class func build(cityName: String?) -> UIViewController {
        let endpoint = EndpointCases.getCountryList(cityName ?? "")
        let viewModel = CountrySelectionViewModel(endpoint: endpoint, cityName: cityName)
        let viewController = CountrySelectionViewController(viewModel: viewModel)
        viewController.title = "İlçe Seçimi"
        return viewController
    }
}
