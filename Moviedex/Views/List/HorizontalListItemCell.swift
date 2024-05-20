//
//  HorizontalListItemCell.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class HorizontalListItemCell: UICollectionViewCell, Reusable {
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterView.image = nil
    }
    
    func update(with viewModel: HorizontalListItemCellModel) {
        viewModel.image { [weak self] image in
            self?.posterView.image = image
        }
    }
    
    private func commonInit() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        contentView.addSubview(posterView)
        
        posterView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
