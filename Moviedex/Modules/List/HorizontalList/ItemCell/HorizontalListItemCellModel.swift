//
//  HorizontalListItemCellModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

struct HorizontalListItemCellModel {
    
    private let content: Content
    
    var imageUrl: URL {
        content.poster
    }
    
    init(content: Content) {
        self.content = content
    }
    
}
