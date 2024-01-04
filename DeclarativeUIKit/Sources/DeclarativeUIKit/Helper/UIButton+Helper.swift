//
//  UIButton+Helper.swift
//
//
//  Created by Windy on 04/01/24.
//

import Combine
import UIKit

public extension UIButton {

    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        setTitle(title, for: .normal)
        return self
    }

    @discardableResult
    func titleColor(_ titleColor: UIColor?) -> Self {
        setTitleColor(titleColor, for: .normal)
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        titleLabel?.font = font
        return self
    }

    @discardableResult
    func onTap(_ onTap: @escaping () -> Void) -> Self {
        addAction(UIAction(handler: { _ in onTap() }), for: .touchUpInside)
        return self
    }
}
