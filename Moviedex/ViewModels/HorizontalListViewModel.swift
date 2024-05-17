//
//  HorizontalListViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

struct HorizontalListViewModel {
    var contents: [Content]
    
    init(contents: [Content] = []) {
        self.contents = contents
    }
}
