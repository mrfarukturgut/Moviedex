//
//  APIProvider.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

protocol Provider {
    
}

class APIProvider: Provider {
    
    private let session = URLSession.shared
    
    private let url: String = "https://www.omdbapi.com/"
    
    func search(by term: String, page: Int, completion: @escaping (Result<Search, Error>) -> Void) {
        
        let parameters = [
            "apiKey": "14d38eb2",
            "s": term,
            "page": "\(page)"
        ]
        
        var components = URLComponents(string: url)
        components?.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        var request = URLRequest(url: components!.url!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            print(data, response, error)
            
            let decoder = JSONDecoder()
            let data = try! decoder.decode(Search.self, from: data!)
            
            print(data)
        }
        
        task.resume()

    }
    
}
