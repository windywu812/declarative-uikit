//
//  UITextField+Helper.swift
//
//
//  Created by Windy on 04/01/24.
//

import UIKit
import Combine

public extension UITextField {
    
    @discardableResult
    func placeholder(_ placeholder: String) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func text(_ text: AnyPublisher<String?, Never>) -> Self {
        textSubscription = text
            .sink { [weak self] in
                self?.text = $0
            }
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func borderStyle(_ borderStyle: BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }
    
    @discardableResult
    func onTextChanged(_ onTextChanged: @escaping (String?) -> Void) -> Self {
        addAction(
            UIAction(handler: { [weak self] _ in
                guard let self else { return }
                onTextChanged(text)
            }), for: .editingChanged
        )
        return self
    }
}

private extension UITextField {
    
    private struct Pointer {
        static var textPointer = 0
    }

    var textSubscription: AnyCancellable? {
        get {
            return objc_getAssociatedObject(self, &Pointer.textPointer) as? AnyCancellable
        }
        set(newValue) {
            objc_setAssociatedObject(self, &Pointer.textPointer, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
