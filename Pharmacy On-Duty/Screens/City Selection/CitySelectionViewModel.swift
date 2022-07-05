//
//  CitySelectionViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//
import Foundation
import RxSwift
import RxRelay

class CitySelectionViewModel: BaseViewModel {
    private let networkManager =  NetworkManager()
    public var displayableList = BehaviorRelay<[CitySelectionDisplayItem]>(value: [])
    private var itemsToDisplay = [CitySelectionDisplayItem]()
    
    public func createData() {
        self.loading.onNext(true)
        let endpoint = EndpointCases.getCities
        getData(endPoint: endpoint)
    }
    
    private func getData(endPoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endPoint, completionHandler: { [weak self] (result: Result<CityModel, Error>) in
            switch result {
            case .success(let data):
                self?.generateDisplayableList(dataModel: data)
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func generateDisplayableList(dataModel: CityModel) {
        if let dataList = dataModel.data, !dataModel.data!.isEmpty {
            for data in dataList {
                itemsToDisplay.append(CitySelectionDisplayItem.city(CityParameters(sehirAd: data.sehirAd, sehirSlug: data.sehirSlug)))
            }
        }
        else {
                
        }
        loading.onNext(false)
        displayableList.accept(itemsToDisplay)
    }
}

