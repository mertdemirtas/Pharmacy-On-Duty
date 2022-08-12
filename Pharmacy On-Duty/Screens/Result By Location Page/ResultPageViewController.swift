//
//  ResultPageLocationViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit
import CoreLocation

class ResultPageViewController: BaseViewController<ResultPageLocationViewModel> {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
        
        bindTableView()
    }
    
    private func bindTableView() {
        _ = viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
            case .result(let data):
                let cell : PharmacyListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "PharmacyListTableViewCell", for: IndexPath(item: index, section: 0)) as! PharmacyListTableViewCell
                
                let convertedData = ResultPageDataFormatter.formatToPharmacyListCardData(data: data)
                cell.setData(data: convertedData)
                cell.genericView.setButtonAction {
                    self.navigationController?.pushViewController(DetailPageBuilder.build(data: data), animated: true)
                }
                return cell
            }
        }
    }
}
