//
//  ListViewController.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class ListViewController: UIViewController {
    
    let listViewModel: ListViewModel = .init()
    
    private lazy var listView: ListView = {
        return .init(viewModel: listViewModel)
    }()
    
    override func loadView() {
        view = listView
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
