//
//  BaseLabel.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 9.04.2022.
//

import UIKit

class BaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initUI() {
        translatesAutoresizingMaskIntoConstraints = false
        text = ""
    }
    
    public func addText(text: String) {
        self.text = (self.text ?? "") + " " + text
    }
}
