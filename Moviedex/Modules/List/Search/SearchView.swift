//
//  SearchView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import UIKit

class SearchView: UIView {
    
    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.returnKeyType = .done
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.placeholder = "Type your search..."
        field.addTarget(self, action: #selector(doneTapped(_:)), for: .editingDidEndOnExit)
        field.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        return field
    }()
    
    private let viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use \(Self.self) on Interface Builder!")
    }
    
    private func commonInit() {
        backgroundColor = .white
        
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        applyShadow()
                
        setupSubviews()
        
        searchField.text = viewModel.term
    }
    
    private func setupSubviews() {
        addSubview(searchField)
        
        searchField.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    @objc
    private func doneTapped(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    @objc
    private func editingChanged(_ textField: UITextField) {
        viewModel.searchDidChange(term: textField.text ?? "")
    }
    
}
