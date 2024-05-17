//
//  VerticalListItemCellModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

struct VerticalListItemCellModel {
    private let content: Content
    
    var title: String {
        content.title
    }
    
    var releaseDate: String {
        content.year
    }
    
    init(content: Content) {
        self.content = content
    }
}
