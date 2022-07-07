//
//  ResultPageLocationViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit
import CoreLocation

class ResultPageLocationViewController: BaseViewController<ResultPageLocationViewModel> {
    
    private var locationManager = LocationManager()
    
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
    
    private lazy var alertController : UIAlertController = {
        let temp = UIAlertController(title: "Konum Ayarlanmadı", message: "Bu özelliği kullanabilmeniz için Konum Servislerini açmanız gerekmektedir.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Vazgeç", style: .cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        })
        let alert = UIAlertAction(title: "Ayarlar'a Git", style: .default, handler: { action in
            if let bundleId = Bundle.main.bundleIdentifier,
            let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") {
                UIApplication.shared.open(url, options: [:], completionHandler: { [weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                })
            }
        })
        
        temp.addAction(cancel)
        temp.addAction(alert)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationPermission()
    }
    
    private func checkLocationPermission() {
        locationManager.controlLocationPermission(completionHandler: { [weak self] status in
            switch status {
            case .usable:
                self?.setupTableView()
                self?.bindTableView()
            case .unsuable:
                self?.present(alertController, animated: true)
            }
        })
    }
    
    private func setupTableView() {
        tableView.registerCell(cells: [PharmacyListTableViewCell.self])
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindTableView() {
        viewModel.setupRequest()
        _ = viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
            case .result(let data):
                let cell : PharmacyListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "PharmacyListTableViewCell", for: IndexPath(item: index, section: 0)) as! PharmacyListTableViewCell
                let convertedData = PharmacyListCardData(title: data.eczaneAdi, adress: data.adresi, latitude: String(data.latitude ?? 0.0), longtitude: String(data.longitude ?? 0.0), distance: String(data.distanceKM ?? 0.0))
                cell.setData(data: convertedData)
                cell.genericView.setButtonAction {
                   // self.navigationController?.pushViewController(DetailPageBuilder.build(data: data), animated: true)
                }
                return cell
            }
        }
    }
}
