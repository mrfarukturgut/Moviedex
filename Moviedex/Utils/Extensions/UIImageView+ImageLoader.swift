//
//  UIImageView+ImageLoader.swift
//  Moviedex
//
//  Created by Faruk Turgut on 22.05.2024.
//

import UIKit

extension UIImageView {
    func loadImage(at url: URL) {
        UIImageLoader.loader.load(url, for: self)
    }
    
    func cancelImageLoad() {
        UIImageLoader.loader.cancel(for: self)
    }
}
