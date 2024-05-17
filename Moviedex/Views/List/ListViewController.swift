//
//  ListViewController.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import UIKit

class ListViewController: UIViewController {
    
    private lazy var listView: ListView = .init()
    
    override func loadView() {
        view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = APIProvider()
        
        
        provider.search(by: "test", page: 1) { result in
            print(result)
        }
    }

}
