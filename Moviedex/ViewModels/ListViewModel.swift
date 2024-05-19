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
        verticalListViewModel.fetch {
            group.leave()
        }
        
        group.enter()
        horizontalListViewModel.fetch {
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("both ended")
        }
    }
    
}
