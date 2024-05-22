//
//  ListViewController.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class ListViewController: UIViewController {
    
    private let listViewModel: ListViewModel = .init()
    
    private lazy var listView: ListView = .init(viewModel: listViewModel)
    private lazy var statefulView: StatefulView = .init(content: listView, viewModel: listViewModel.statefulViewModel)
    
    override func loadView() {
        view = statefulView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List"
        
        setupEvents()
    }
    
    private func setupEvents() {
        listViewModel.onSelect = { [weak self] viewModel in
            let detailController = DetailViewController(viewModel: viewModel)
            self?.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
