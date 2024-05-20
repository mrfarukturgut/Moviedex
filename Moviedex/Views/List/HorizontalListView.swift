//
//  HorizontalListView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import SnapKit
import UIKit

class HorizontalListView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 90, height: 160)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(cell: HorizontalListItemCell.self)
        
        layout.minimumInteritemSpacing = 8
        
        return collectionView
    }()
    
    private let viewModel: HorizontalListViewModel
    
    init(viewModel: HorizontalListViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use \(Self.self) on Interface Builder!")
    }
    
    private func commonInit() {
        backgroundColor = .white
        
        viewModel.onChanged = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.fetch()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HorizontalListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: HorizontalListItemCell.self, for: indexPath)
        cell.update(with: .init(content: viewModel.contents[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.viewWillShowItem(at: indexPath.row)
    }
}
