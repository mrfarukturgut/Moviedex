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
