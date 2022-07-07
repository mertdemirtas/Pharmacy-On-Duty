//
//  ResultPageLocationViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import Foundation
import RxSwift
import RxRelay
import CoreLocation

class ResultPageLocationViewModel: BaseViewModel {
    
    private let networkManager =  NetworkManager()
    public var displayableList = BehaviorRelay<[ResultPageLocationDisplayItem]>(value: [])
    private var itemsToDisplay = [ResultPageLocationDisplayItem]()
    
    public func setupRequest() {
        let locationManager = LocationManager()
        createEndpoint(location: locationManager.getLocation())
    }
    
    private func createEndpoint(location: CLLocation) {
        let endPoint = EndpointCases.getByLocation(String(location.coordinate.latitude), String(location.coordinate.longitude))
        getData(endPoint: endPoint)
    }
    
    private func getData(endPoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endPoint, completionHandler: { [weak self] (result: Result<PharmacyDistanceModel, Error>) in
            switch result {
            case .success(let data):
                self?.generateDisplayableList(dataModel: data)
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func generateDisplayableList(dataModel: PharmacyDistanceModel) {
        if let dataList = dataModel.data, !dataModel.data!.isEmpty {
            for data in dataList {
                itemsToDisplay.append(ResultPageLocationDisplayItem.result(data))
            }
        }
        else {
            
        }
        loading.onNext(false)
        displayableList.accept(itemsToDisplay)
    }
}
