//
//  UIColor+Extension.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 12.04.2022.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

public extension UIColor {
    static let navBarColor: UIColor = UIColor(r: 190, g: 64, b: 74, alpha: 1)
    static let appBackgroundColor: UIColor = UIColor(r: 235, g: 235, b: 235, alpha: 1)
    static let spinnerColor: UIColor = .white
    static let mainPageTableViewCellColor: UIColor = .clear
}
