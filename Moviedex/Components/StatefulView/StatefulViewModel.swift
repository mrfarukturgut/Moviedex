//
//  StatefulViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import Foundation

class StatefulViewModel {
    
    var onChange: ((ViewState) -> Void)?
    
    private(set) var state: ViewState
    
    init(state: ViewState = .content) {
        self.state = state
    }
    
    func update(state: ViewState) {
        self.state = state
        onChange?(state)
    }
}
