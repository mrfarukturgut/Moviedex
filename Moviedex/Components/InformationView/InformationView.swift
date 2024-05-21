//
//  InformationView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import UIKit

class InformationView: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var warningImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "warningIcon")
        return imageView
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
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
        backgroundColor = .white
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.center.equalToSuperview()
        }
        
        stackView.addArrangedSubview(warningImageView)
        stackView.addArrangedSubview(warningLabel)
        
        warningImageView.snp.makeConstraints { make in
            make.height.width.equalTo(52)
        }
    }
    
    func update(with viewModel: InformationViewModel) {
        warningLabel.text = viewModel.message
    }
    
}
