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
    var statefulViewModel: StatefulViewModel
    
    var onSelect: ((DetailViewModel) -> Void)?
    
    private var searchTerm: String = "Star"
    
    init() {
        self.verticalListViewModel = .init(term: searchTerm)
        self.horizontalListViewModel = .init()
        self.searchViewModel = .init(term: searchTerm)
        self.statefulViewModel = .init()
        
        setupEvents()
    }
    
    private func setupEvents() {
        searchViewModel.onSearch = { [weak self] term in
            self?.searchTerm = term
            self?.verticalListViewModel.update(term: term)
        }
        
        verticalListViewModel.onSelect = { [weak self] content in
            let viewModel = DetailViewModel(content: content)
            
            self?.onSelect?(viewModel)
        }
        
        horizontalListViewModel.onSelect = { [weak self] content in
            let viewModel = DetailViewModel(content: content)
            
            self?.onSelect?(viewModel)
        }
    }
    
    func fetchContents() {
        statefulViewModel.update(state: .loading)
        
        var errors: [Error?] = []
        
        let group = DispatchGroup()
        
        group.enter()
        verticalListViewModel.fetch { error in
            errors.append(error)
            group.leave()
        }
        
        group.enter()
        horizontalListViewModel.fetch { error in
            errors.append(error)
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            let errors = errors.compactMap({ $0 })
            
            guard errors.count == 0 else {
                let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
                self?.statefulViewModel.update(state: .information(message: message))
                return
            }
            
            self?.statefulViewModel.update(state: .content)
        }
    }
    
}
