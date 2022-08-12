//
//  MainPageViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//


class MainPageViewModel: BaseViewModel {
    private var locationManager: LocationManager?
    public var status: LocationEnum?
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        super.init()
    }
    
    public func requestLocationPermission() {
        locationManager?.controlLocationPermission(completionHandler: { [weak self] result in
            self?.status = result
        })
    }
    
    public func getLocationStatus() -> LocationEnum? {
        return status
    }
}
