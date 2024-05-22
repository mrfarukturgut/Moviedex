//
//  MainThread.swift
//  Moviedex
//
//  Created by Faruk Turgut on 18.05.2024.
//

import Foundation

@propertyWrapper
struct MainThread<T> {
    private var value: (T) -> Void
    
    var wrappedValue: (T) -> Void {
        get { value }
        set {
            value = { result in
                DispatchQueue.main.async {
                    newValue(result)
                }
            }
        }
    }
    
    init(wrappedValue: @escaping (T) -> Void) {
        self.value = { result in
            DispatchQueue.main.async {
                wrappedValue(result)
            }
        }
    }
}
