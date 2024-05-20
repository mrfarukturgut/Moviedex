//
//  VerticalListView.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import SnapKit
import UIKit

class VerticalListView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(cell: VerticalListItemCell.self)
        return tableView
    }()
    
    private let viewModel: VerticalListViewModel
    
    init(viewModel: VerticalListViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use \(Self.self) on Interface Builder!")
    }
    
    private func commonInit() {
        backgroundColor = .white
        
        viewModel.onChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.fetch()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension VerticalListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: VerticalListItemCell.self, for: indexPath)
        cell.update(with: .init(content: viewModel.contents[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.viewWillShowItem(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
