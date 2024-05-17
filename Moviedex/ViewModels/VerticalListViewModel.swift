//
//  VerticalListViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

class VerticalListViewModel {
    
    var onChanged: (([Content]) -> Void)?
    
    var contents: [Content]
    
    init(contents: [Content] = []) {
        self.contents = contents
    }
    
    func update(contents: [Content]) {
        self.contents = contents
        onChanged?(self.contents)
    }
}
