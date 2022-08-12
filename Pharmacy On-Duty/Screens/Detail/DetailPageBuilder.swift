//
//  DetailPageBuilder.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

import UIKit

class DetailPageBuilder {
    class func build(data: ResultPageData) -> UIViewController{
        let viewModel = DetailPageViewModel(data: data)
        let viewController = DetailPageViewController(viewModel: viewModel)
        viewController.title = data.title
        return viewController
    }
}
