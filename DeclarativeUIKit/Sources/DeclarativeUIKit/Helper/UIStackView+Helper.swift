//
//  UIStackView+Helper.swift
//
//
//  Created by Windy on 04/01/24.
//

import UIKit

public extension UIStackView {
    
    @discardableResult
    func layoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = layoutMargins
        return self
    }
}

public extension UIEdgeInsets {
    
    init(all margin: CGFloat) {
        self.init(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    init(horizontal horizontalMargin: CGFloat = 0, vertical verticalMargin: CGFloat = 0) {
        self.init(
            top: verticalMargin,
            left: horizontalMargin,
            bottom: verticalMargin,
            right: horizontalMargin
        )
    }
}
