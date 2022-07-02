//
//  OperationButtonContainerView.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import UIKit

class OperationButtonContainerView: GenericBaseView<OperationButtonData> {
    // MARK: Constants
    private let imageWidht: CGFloat = 140.0
    private let imageHeight: CGFloat = 140.0
    
    // MARK: Components
    private lazy var stackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.alignment = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imgView: BaseView = {
        let temp = BaseView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleToFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var title: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textColor = .black
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 22)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func addMajorViewComponents() {
        addSubview(stackView)
        stackView.addArrangedSubview(imgView)
        imgView.addSubview(image)
        stackView.addArrangedSubview(title)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
            
            image.heightAnchor.constraint(equalToConstant: imageHeight),
            image.widthAnchor.constraint(equalToConstant: imageWidht),
            image.topAnchor.constraint(equalTo: imgView.topAnchor),
            image.leadingAnchor.constraint(equalTo: imgView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: imgView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: imgView.bottomAnchor)

        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        title.text = data.titleText
        image.image = UIImage(named: data.image ?? "placeholder")
    }
}
