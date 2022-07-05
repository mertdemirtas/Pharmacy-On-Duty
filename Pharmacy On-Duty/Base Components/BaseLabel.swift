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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addText(text: String) {
        self.text = (self.text ?? "") + " " + text
    }
}
