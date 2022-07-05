//
//  BaseTableViewCell.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 7.04.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
        
    private var seperator: BaseView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        addMajorViewComponents()
        setupViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.backgroundColor = .mainPageTableViewCellColor
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func addMajorViewComponents() { }
    
    func setupViewConfigurations() { }
    
}
