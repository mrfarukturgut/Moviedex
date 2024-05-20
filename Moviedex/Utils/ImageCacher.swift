//
//  ImageCacher.swift
//  Moviedex
//
//  Created by Faruk Turgut on 20.05.2024.
//

import UIKit

class ImageCacher {
    
    static private let cache: NSCache<NSString, UIImage> = .init()
    
    class func image(for url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        if let image = cache.object(forKey: url as NSString) {
            completion(.success(image))
            return
        }
        
        guard let url = URL(string: url) else {
            completion(.failure(NSError()))
            return
        }
        
        downloadImage(from: url, completion: completion)
    }
    
    private class func downloadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(.success(UIImage(data: data!)!))
            }
        }.resume()
    }
    
}
