//
//  CitySelectionViewController.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 4.07.2022.
//

import UIKit

class CitySelectionViewController: BaseViewController<CitySelectionViewModel> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.indicatorStyle = UIScrollView.IndicatorStyle.black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        viewModel.createData()
    }
    
    private func prepareTableView() {
        tableView.registerCell(cells: [CityCardTableViewCell.self])
        bindTableView()
    }
    
    override func addViewComponents() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindTableView() {
        _ = viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
            case .city(let data):
                let cell : CityCardTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CityCardTableViewCell", for: IndexPath(item: index, section: 0)) as! CityCardTableViewCell
                cell.setData(data: CityData(name: data.sehirAd))
                cell.setButtonAction {
                    self.navigationController?.pushViewController(CountrySelectionBuilder.build(cityName: data.sehirSlug), animated: true)
                }
                return cell

            case .empty:
                return UITableViewCell()
            }
        }
    }
}
