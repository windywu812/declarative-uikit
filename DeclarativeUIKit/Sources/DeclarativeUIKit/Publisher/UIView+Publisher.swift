//
//  UIView+Publisher.swift
//
//
//  Created by Windy on 05/01/24.
//

import UIKit
import Combine

public extension UIView {

    @discardableResult
    func isHidden(_ isHidden: some Publisher<Bool, Never>) -> Self {
        isHiddenSubscription = isHidden
            .sink { [weak self] in self?.isHidden = $0 }
        return self
    }

    @discardableResult
    func shadow(color: UIColor?, opacity: Float, offset: CGSize, radius: CGFloat) -> UIView {
        apply(color: color, opacity: opacity, offset: offset, radius: radius)

        boundsCancellable = publisher(for: \.bounds)
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in self?.updateShadowPath() })
        
        return self
    }
    
    private func apply(color: UIColor?, opacity: Float, offset: CGSize, radius: CGFloat) {
        clipsToBounds = false
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shouldRasterize = false
    }
    
    private func updateShadowPath() {
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: layer.cornerRadius
        ).cgPath
    }
}

private extension UIView {
    
    struct Pointer {
        static var boundsPointer: UInt8 = 0
        static var isHiddenPointer = 0
    }

    var boundsCancellable: AnyCancellable? {
        get {
            objc_getAssociatedObject(self, &Pointer.boundsPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &Pointer.boundsPointer,
                newValue,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
    }

    var isHiddenSubscription: AnyCancellable? {
        get {
            objc_getAssociatedObject(self, &Pointer.isHiddenPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &Pointer.isHiddenPointer,
                newValue,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
    }
}

