//
//  ResultPageViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

class ResultPageViewController: BaseViewController<ResultPageViewModel> {
    private var locationManager: CLLocationManager?
    
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var cardView: PharmacyListCardButton = {
        let temp = PharmacyListCardButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManager()
        setupTableView()
        bindTableView()
        viewModel.controlData()
    }
    
    private func initLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
    
    private func setupTableView() {
        tableView.registerCell(cells: [PharmacyListTableViewCell.self])
    }
    
    private func bindTableView() {
        _ = viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
                
            case .result(let data):
                let cell : PharmacyListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "PharmacyListTableViewCell", for: IndexPath(item: index, section: 0)) as! PharmacyListTableViewCell
                let convertedData = PharmacyListCardData(title: data.eczaneAdi, adress: data.adresi, latitude: String(data.latitude ?? 0.0), longtitude: String(data.longitude ?? 0.0), distance: "")
                cell.setData(data: convertedData)
                cell.genericView.setButtonAction {
                    self.navigationController?.pushViewController(DetailPageBuilder.build(data: data), animated: true)
                }
                return cell
            }
        }
    }
    
    override func addViewComponents() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ResultPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("inuse")
        @unknown default:
            break
        }
    }
}
