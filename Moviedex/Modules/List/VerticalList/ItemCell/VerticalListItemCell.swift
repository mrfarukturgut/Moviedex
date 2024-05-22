//
//  VerticalListItemCell.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class VerticalListItemCell: UITableViewCell, Reusable {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.applyShadow()
        return view
    }()
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterView.image = nil
        posterView.cancelImageLoad()
    }
    
    func update(with viewModel: VerticalListItemCellModel) {
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        posterView.loadImage(at: viewModel.imageUrl)
    }
    
    private func commonInit() {
        selectionStyle = .none
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.verticalEdges.equalToSuperview().inset(4)
        }
        
        containerView.addSubviews(posterView, labelStackView)
        
        posterView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(45)
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().inset(8)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().inset(8)
            make.leading.equalTo(posterView.snp.trailing).offset(8)
        }
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(releaseDateLabel)
    }
}
