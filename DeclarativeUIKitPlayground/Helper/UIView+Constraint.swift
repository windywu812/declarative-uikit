//
//  UIView+Constraint.swift
//
//
//  Created by Windy on 04/01/24.
//

import UIKit

public extension UIView {
    
    enum Constraint {
        case fill
        case fillToSafeArea
    }
    
    func addSubview(_ view: UIView, constraint type: Constraint) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .fill:
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        case .fillToSafeArea:
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }
}
