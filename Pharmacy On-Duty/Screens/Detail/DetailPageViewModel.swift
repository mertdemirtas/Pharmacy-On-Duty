//
//  DetailPageViewModel.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 3.07.2022.
//

class DetailPageViewModel: BaseViewModel {
    private var data: Datum
    
    init(data: Datum) {
        self.data = data
        super.init()
    }
    
    public func getData() -> Datum {
        return data
    }
}
