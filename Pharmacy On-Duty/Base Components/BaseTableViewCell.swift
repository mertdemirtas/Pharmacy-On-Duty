//
//  BaseTableViewCell.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 7.04.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
        
    private var seperator: BaseView?
    private var buttonTapCallback: () -> () = {}
    
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
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(BaseTableViewCell.buttonTapped))
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { finish in
            if finish {
                self.isUserInteractionEnabled = true
                self.buttonTappedAction()
            }
        }
    }
    
    func setButtonAction(action:@escaping () -> ()) {
        self.buttonTapCallback = action
    }
    
    private func buttonTappedAction() {
        buttonTapCallback()
    }
    
    func addMajorViewComponents() { }
    
    func setupViewConfigurations() { }
    
}
