//
//  LoadingView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import UIKit

class LoadingView: UIView {
    
    private lazy var activityIndicator: UIActivityIndicatorView = .init()
    
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
        
        activityIndicator.startAnimating()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.height.width.equalTo(120)
            make.center.equalToSuperview()
        }
    }
}

