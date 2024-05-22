//
//  DetailViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import UIKit

class DetailViewModel {
    
    private let content: Content
    
    var title: String {
        content.title
    }
    
    var imageUrl: URL {
        content.poster
    }
    
    init(content: Content) {
        self.content = content
    }
}
