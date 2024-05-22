//
//  Content.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

struct Content: Decodable {
    let id: String
    let title: String
    let year: String
    let poster: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}
