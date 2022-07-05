//
//  CountrySelectionViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import RxSwift
import RxRelay

class CountrySelectionViewModel: BaseViewModel {
    private let networkManager =  NetworkManager()
    public var displayableList = BehaviorRelay<[CountryDisplayItem]>(value: [])
    private var itemsToDisplay = [CountryDisplayItem]()
    
    let endpoint: Endpoint
    let cityName: String?
    
    init(endpoint: Endpoint, cityName: String?) {
        self.endpoint = endpoint
        self.cityName = cityName
        super.init()
    }

    
    public func createData() {
        self.loading.onNext(true)
        getData(endPoint: endpoint)
    }
    
    private func getData(endPoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endPoint, completionHandler: { [weak self] (result: Result<CountryModel, Error>) in
            switch result {
            case .success(let data):
                self?.generateDisplayableList(dataModel: data)
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func generateDisplayableList(dataModel: CountryModel) {
        if let dataList = dataModel.data, !dataModel.data!.isEmpty {
            for data in dataList {
                itemsToDisplay.append(CountryDisplayItem.country(data))
            }
        }
        else {
            
        }
        loading.onNext(false)
        displayableList.accept(itemsToDisplay)
    }
}
