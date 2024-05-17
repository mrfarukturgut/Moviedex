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
    
    private let provider: Provider
    
    init(provider: Provider = APIProvider()) {
        self.verticalListViewModel = .init()
        self.horizontalListViewModel = .init()
        self.provider = provider
    }
    
    func fetchContents() {
        let group = DispatchGroup()
        
        group.enter()
        fetchVerticalListData {
            group.leave()
        }
        
        group.enter()
        fetchHorizontalListData {
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("both ended")
        }
    }
    
    private func fetchVerticalListData(completion: @escaping () -> Void) {
        provider.search(by: "test", page: 1) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self?.verticalListViewModel.update(contents: response.search)
                case .failure(_):
                    break
                }
                completion()
            }
        }
    }
    
    private func fetchHorizontalListData(completion: @escaping () -> Void) {
        provider.search(by: "another", page: 1) { result in
            print(result)
            completion()
        }
    }
    
}
