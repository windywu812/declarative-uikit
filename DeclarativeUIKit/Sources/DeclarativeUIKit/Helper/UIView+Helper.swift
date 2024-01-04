//
//  UIView+Helper.swift
//
//
//  Created by Windy on 04/01/24.
//

import UIKit
import Combine

public extension UIView {
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    @discardableResult
    func tintColor(_ tintColor: UIColor?) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }

    @discardableResult
    func contentHuggingPriority(
        _ priority: UILayoutPriority,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
}
