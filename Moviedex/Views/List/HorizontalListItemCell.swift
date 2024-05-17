//
//  HorizontalListItemCell.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class HorizontalListItemCell: UICollectionViewCell {
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFit
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
    
    private func commonInit() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        contentView.addSubview(posterView)
        
        posterView.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.width.equalTo(90)
            make.edges.equalToSuperview()
        }
    }
}
