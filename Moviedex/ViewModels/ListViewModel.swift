//
//  ListViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

class ListViewModel {
    var verticalListViewModel: VerticalListViewModel
    var horizontalListViewModel: HorizontalListViewModel
    var searchViewModel: SearchViewModel
    
    private var searchTerm: String = "Star"
    
    init() {
        self.verticalListViewModel = .init(term: searchTerm)
        self.horizontalListViewModel = .init()
        self.searchViewModel = .init(term: searchTerm)
        
        setupEvents()
    }
    
    private func setupEvents() {
        searchViewModel.onSearch = { [weak self] term in
            self?.searchTerm = term
            self?.verticalListViewModel.update(term: term)
        }
    }
    
    func fetchContents() {
//        let group = DispatchGroup()
//        
//        group.enter()
//        verticalListViewModel.fetch {
//            group.leave()
//        }
//        
//        group.enter()
//        horizontalListViewModel.fetch {
//            group.leave()
//        }
//        
//        group.notify(queue: .main) {
//            print("both ended")
//        }
    }
    
}
