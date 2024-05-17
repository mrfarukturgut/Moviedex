//
//  ListView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import SnapKit
import UIKit

class ListView: UIView {
    
    private lazy var verticalListView: VerticalListView = .init()
    private lazy var horizontalListView: HorizontalListView = .init()
    
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
        addSubviews(verticalListView, horizontalListView)
        
        horizontalListView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(192)
        }
        
        verticalListView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(horizontalListView.snp.top)
        }
    }
    
}
