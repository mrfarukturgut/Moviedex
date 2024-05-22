//
//  HorizontalListViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

    

class HorizontalListViewModel {
    
    private let provider: Provider
    private var page: Int = 1
    private var term: String = "Comedy"
    private var hasMoreContent: Bool = true
    
    var onSelect: ((Content) -> Void)?
    var onChanged: (() -> Void)?
    
    var contents: [Content]
    
    init(contents: [Content] = [], provider: Provider = APIProvider()) {
        self.provider = provider
        self.contents = contents
    }
    
    func willShowItem(at index: Int) {
        guard index == contents.count - 4, hasMoreContent else { return }
        fetch()
    }
    
    func didSelectItem(at index: Int) {
        onSelect?(contents[index])
    }
    
    func fetch(completion: @escaping ((Error?) -> Void) = { _ in }) {
        provider.search(by: term, page: page) { [weak self] result in
            switch result {
            case let .success(response):
                guard response.search.count > 0 else {
                    self?.hasMoreContent = false
                    return
                }
                
                self?.update(contents: response.search)
                self?.page += 1
                
                completion(nil)
            case let .failure(error):
                self?.update(contents: [])
                
                completion(error)
            }
        }
    }
    
    private func update(contents: [Content]) {
        self.contents += contents
        onChanged?()
    }
}
