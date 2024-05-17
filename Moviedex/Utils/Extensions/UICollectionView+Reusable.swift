//
//  UICollectionView+Reusable.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

extension UICollectionView {
    func register<T: Reusable>(cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    func dequeue<T: Reusable>(cell: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Misconfigured cell type, \(cell)!")
        }

        return cell
    }
}
