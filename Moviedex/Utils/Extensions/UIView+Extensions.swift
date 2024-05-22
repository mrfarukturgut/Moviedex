//
//  UIView+Extensions.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
    
    func applyShadow(
        color: UIColor = .black,
        opacity: Float = 0.25,
        offset: CGSize = CGSize(width: 0, height: 0),
        radius: CGFloat = 2,
        shouldRasterize: Bool = false
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
        
        if shouldRasterize {
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        } else {
            self.layer.shouldRasterize = false
        }
    }
    
}
