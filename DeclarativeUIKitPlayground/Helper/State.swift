//
//  Bindable.swift
//  DeclarativeUIKitPlayground
//
//  Created by Windy on 05/01/24.
//

import Combine
import Foundation

@propertyWrapper
public struct State<Value> {
    public var wrappedValue: Value {
        get { observableValue.value }
        nonmutating set { observableValue.send(newValue) }
    }
    
    public let projectedValue: AnyPublisher<Value, Never>
    
    private let observableValue: CurrentValueSubject<Value, Never>
    public init(wrappedValue: Value) {
        observableValue = CurrentValueSubject(wrappedValue)
        projectedValue = observableValue
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
