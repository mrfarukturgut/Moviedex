//
//  VerticalListItemCellModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

struct VerticalListItemCellModel {
    
    private let content: Content
    
    var title: String {
        content.title
    }
    
    var releaseDate: String {
        content.year
    }
    
    var imageUrl: URL {
        content.poster
    }
    
    init(content: Content) {
        self.content = content
    }
    
}
