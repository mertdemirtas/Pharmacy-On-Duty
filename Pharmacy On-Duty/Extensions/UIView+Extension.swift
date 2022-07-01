//
//  UIView+Extension.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 9.04.2022.
//

import UIKit

extension UIView {
    
    func startTappedAnimation(with completion: @escaping (Bool) -> Void) {
        
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: completion)
        
        self.layoutIfNeeded()
    }
    
    func tappedAnimationWithoutClosure() {
        
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
        self.layoutIfNeeded()
    }
}
