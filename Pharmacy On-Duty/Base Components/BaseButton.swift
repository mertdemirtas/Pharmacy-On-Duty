//
//  BaseButton.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 9.04.2022.
//

import UIKit

class BaseButton<T>: GenericBaseView<T>, UIGestureRecognizerDelegate {
    
    private var buttonTapCallback: () -> () = {}
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()

    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()
    
    lazy var buttonLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func setupViewConfigurations() {
        prepareShadowView()
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(BaseButton.buttonTapped))
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
    
    open func addViewOnCenter(view: UIView) {
        self.containerView.addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16.0),
            view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16.0),
            view.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor)
        ])
    }
    
    func setButtonAction(action:@escaping () -> ()) {
        self.buttonTapCallback = action
    }
    
    private func buttonTappedAction() {
        buttonTapCallback()
    }
    
    private func prepareShadowView() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)

        NSLayoutConstraint.activate([

            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor)
        ])
    }
}
