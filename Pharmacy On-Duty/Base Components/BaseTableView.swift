//
//  BaseTableView.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 7.04.2022.
//

import UIKit

class BaseTableView: UITableView {
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundView = UIView()
        self.backgroundColor = .clear
        self.backgroundView!.backgroundColor = .appBackgroundColor
        separatorStyle = .none
    }
    
    private func register<T: BaseTableViewCell>(cell: T.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    open func registerCell(cells: [BaseTableViewCell.Type]) {
        for cell in cells {
            register(cell: cell.self)
        }
    }
}
