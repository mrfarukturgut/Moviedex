//
//  ListView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import SnapKit
import UIKit

class ListView: UIView {
    
    private lazy var verticalListView: VerticalListView = .init(viewModel: viewModel.verticalListViewModel)
    private lazy var horizontalListView: HorizontalListView = .init(viewModel: viewModel.horizontalListViewModel)
    private lazy var searchView: SearchView = .init(viewModel: viewModel.searchViewModel)
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use \(Self.self) on Interface Builder!")
    }
    
    private func commonInit() {
        backgroundColor = .white
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubviews(verticalListView, horizontalListView, searchView)
        
        searchView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(8)
        }
        
        horizontalListView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(176)
        }
        
        verticalListView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(horizontalListView.snp.top)
        }
    }
    
}
