//
//  UILabel+Publisher.swift
//
//
//  Created by Windy on 05/01/24.
//

import Combine
import UIKit

public extension UILabel {

    @discardableResult
    func text(_ text: some Publisher<String?, Never>) -> Self {
        textSubscription = text
            .sink { [weak self] in
                self?.text = $0
            }
        return self
    }

    @discardableResult
    func numberOfLines(_ numberOfLines: some Publisher<Int, Never>) -> Self {
        numberOfLinesSubscription = numberOfLines
            .sink { [weak self] numberOfLines in
                self?.numberOfLines = numberOfLines
            }
        return self
    }
}

private extension UILabel {

    private struct Pointer {
        static var textPointer = 0
        static var numberOfLinesPointer = 0
    }

    var textSubscription: AnyCancellable? {
        get {
            objc_getAssociatedObject(self, &Pointer.textPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &Pointer.textPointer,
                newValue,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
    }

    var numberOfLinesSubscription: AnyCancellable? {
        get {
            objc_getAssociatedObject(self, &Pointer.numberOfLinesPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &Pointer.numberOfLinesPointer,
                newValue,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
    }
}
