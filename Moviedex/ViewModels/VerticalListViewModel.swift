//
//  VerticalListViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

class VerticalListViewModel {
    
    private let provider: Provider
    
    var onChanged: (([Content]) -> Void)?
    
    var contents: [Content]
    
    init(contents: [Content] = [], provider: Provider = APIProvider()) {
        self.provider = provider
        self.contents = contents
    }
    
    func fetch(completion: @escaping () -> Void) {
        provider.search(by: "test", page: 1) { [weak self] result in
            switch result {
            case let .success(response):
                self?.update(contents: response.search)
            case .failure(_):
                break
            }
            completion()
        }
    }
    
    private func update(contents: [Content]) {
        self.contents = contents
        onChanged?(self.contents)
    }
}
