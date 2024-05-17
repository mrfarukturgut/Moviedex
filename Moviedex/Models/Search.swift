//
//  Search.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

struct Search: Decodable {
    let search: [Content]
    let response: Bool
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case error = "Error"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        
        let response = try container.decode(String.self, forKey: .response)
        
        if response.lowercased() == "true" {
            self.response = true
        } else {
            self.response = false
        }
        
        let search = try container.decodeIfPresent([Content].self, forKey: .search)
        
        self.search = search ?? []
    }
}
