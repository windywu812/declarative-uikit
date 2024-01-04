//
//  UIButton+Publisher.swift
//
//
//  Created by Windy on 05/01/24.
//

import Combine
import UIKit

public extension UIControl {
    
    @discardableResult
    func isEnabled(_ isEnabled: some Publisher<Bool, Never>) -> Self {
        isEnabledSubscription = isEnabled
            .sink { [weak self] in
                self?.isEnabled = $0
            }
        return self
    }
}

private extension UIControl {

    private struct Pointer {
        static var isEnabledPointer = 0
    }

    var isEnabledSubscription: AnyCancellable? {
        get {
            objc_getAssociatedObject(self, &Pointer.isEnabledPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &Pointer.isEnabledPointer,
                newValue,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
    }
}
