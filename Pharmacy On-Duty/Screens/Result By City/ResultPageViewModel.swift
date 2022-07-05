//
//  ResultPageViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import RxSwift
import RxRelay

class ResultPageViewModel: BaseViewModel {
    
    private let networkManager =  NetworkManager()
    public var displayableList = BehaviorRelay<[ResultPageDisplayItem]>(value: [])
    private var itemsToDisplay = [ResultPageDisplayItem]()
    
    public let endPoint: Endpoint
    
    init(endPoint: Endpoint) {
        self.endPoint = endPoint
        super.init()
    }
    
    public func controlData() {
        
        createEndpoint()
    }
    
    private func createEndpoint() {
        
        getData(endPoint: endPoint)
    }
    
    private func getData(endPoint: Endpoint) {
        loading.onNext(true)
        networkManager.request(from: endPoint, completionHandler: { [weak self] (result: Result<PharmacyModel, Error>) in
            switch result {
            case .success(let data):
                self?.generateDisplayableList(dataModel: data)
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func generateDisplayableList(dataModel: PharmacyModel) {
        if let dataList = dataModel.data, !dataModel.data!.isEmpty {
            for data in dataList {
                itemsToDisplay.append(ResultPageDisplayItem.result(data))
            }
        }
        else {
            
        }
        loading.onNext(false)
        displayableList.accept(itemsToDisplay)
    }
}
