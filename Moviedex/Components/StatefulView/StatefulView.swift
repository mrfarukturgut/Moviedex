//
//  StatefulView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import UIKit

class StatefulView<T: UIView>: UIView {
    
    private lazy var stackView: UIStackView = .init()
    private lazy var loadingView: LoadingView = .init()
    private lazy var informationView: InformationView = .init()
    
    private let content: T
    private let viewModel: StatefulViewModel
    
    init(content: T, viewModel: StatefulViewModel) {
        self.content = content
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use \(Self.self) on Interface Builder!")
    }
    
    private func commonInit() {
        setupSubviews()
        setupEvents()
        
        updateView(with: viewModel.state)
    }
    
    private func setupEvents() {
        viewModel.onChange = { [weak self] state in
            self?.updateView(with: state)
        }
    }
    
    private func updateView(with state: ViewState) {
        switch state {
        case .content:
            stackView.isHidden = true
            informationView.isHidden = true
            loadingView.isHidden = true
        case .loading:
            stackView.isHidden = false
            informationView.isHidden = true
            loadingView.isHidden = false
        case .information(let message):
            informationView.update(with: .init(message: message))
            
            stackView.isHidden = false
            informationView.isHidden = false
            loadingView.isHidden = true
        }
    }
    
    private func setupSubviews() {
        addSubviews(content, stackView)
        
        [loadingView, informationView].forEach({
            $0.isHidden = true
            stackView.addArrangedSubview($0)
        })
        
        content.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bringSubviewToFront(stackView)
    }
    
}
