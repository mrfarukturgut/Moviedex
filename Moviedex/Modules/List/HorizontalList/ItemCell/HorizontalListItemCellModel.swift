//
//  HorizontalListItemCellModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

struct HorizontalListItemCellModel {
    
    private let content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    func image(completion: @escaping (UIImage) -> Void) {
        ImageCacher.image(for: content.poster) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
