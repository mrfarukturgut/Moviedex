//
//  Search.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

struct Search: Decodable {
    let search: [Content]?
    let response: Bool
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case error = "Error"
    }
}
