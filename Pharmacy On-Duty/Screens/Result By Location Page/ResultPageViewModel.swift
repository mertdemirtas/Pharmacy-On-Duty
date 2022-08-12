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
import MapKit

class ResultPageViewModel: BaseViewModel {
    
    private let networkManager =  NetworkManager()
    public var displayableList = BehaviorRelay<[ResultPageDisplayItem]>(value: [])
    private var itemsToDisplay = [ResultPageDisplayItem]()
    let locationManager = LocationManager()
    public var endPoint: Endpoint
    
    private var eczaneDataList: [DistanceData] = []
    private var tempData: DistanceData?
    
    init(endPoint: Endpoint) {
        self.endPoint = endPoint
        super.init()
        self.getData(endPoint: endPoint)
        self.locationManager.locationManagerDelegate = self
    }
    
    public func getLocation() -> CLLocationCoordinate2D {
        return locationManager.getLocation()
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
        guard let dataList = dataModel.data, !dataModel.data!.isEmpty else {
            self.loading.onNext(false)
            itemsToDisplay.append(ResultPageDisplayItem.empty)
            self.displayableList.accept(self.itemsToDisplay)
            return
        }
        
        self.eczaneDataList = dataList
        tempData = self.eczaneDataList.removeFirst()
        locationManager.getCoordinates(address: tempData?.adresi ?? "")
    }
}

extension ResultPageViewModel: ResultPageLocationListProtocol {
    func appendLocationToList(with location: CLLocationCoordinate2D) {
        let resultPageData = ResultPageDataFormatter.formatToResultPageData(data: tempData, sourceLocation: locationManager.getLocation(), destinationLocation: location)
        self.itemsToDisplay.append(ResultPageDisplayItem.result(resultPageData))
    }
    
    func getNextItem() -> String? {
        if eczaneDataList.isEmpty {
            return nil
        }
        
        tempData = eczaneDataList.removeFirst()
        return tempData?.adresi
    }
    
    func reloadList() {
        self.loading.onNext(false)
        self.displayableList.accept(self.itemsToDisplay)
    }
    
    
}

protocol ResultPageLocationListProtocol {
    func appendLocationToList(with location: CLLocationCoordinate2D)
    func getNextItem() -> String?
    func reloadList()
}
