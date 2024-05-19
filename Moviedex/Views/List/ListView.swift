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
        
        viewModel.fetchContents()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubviews(verticalListView, horizontalListView)
        
        horizontalListView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(172)
        }
        
        verticalListView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(horizontalListView.snp.top)
        }
    }
    
}
