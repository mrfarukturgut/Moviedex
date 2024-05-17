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

}
