//
//  SearchViewModel.swift
//  Moviedex
//
//  Created by Faruk Turgut on 21.05.2024.
//

import Foundation

class SearchViewModel {
    
    private var timer: Timer?
    
    var onSearch: ((String) -> Void)?
    
    var term: String
    
    init(term: String) {
        self.term = term
    }
    
    func searchDidChange(term: String) {
        self.term = term
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(executeOnSearch), userInfo: nil, repeats: false)
    }
    
    @objc
    private func executeOnSearch() {
        onSearch?(term)
    }
}
