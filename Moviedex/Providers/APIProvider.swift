//
//  APIProvider.swift
//  Moviedex
//
//  Created by Faruk Turgut on 17.05.2024.
//

import Foundation

protocol Provider {
    func search(by term: String, page: Int, completion: @escaping (Result<Search, Error>) -> Void)
}

class APIProvider: Provider {
    
    private let session = URLSession.shared
    
    private let url: String
    
    init(url: String = "https://www.omdbapi.com/") {
        self.url = url
    }
    
    func search(by term: String, page: Int, completion: @escaping (Result<Search, Error>) -> Void) {
        
        @MainThread var completion = completion
        
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
            
            let decoder = JSONDecoder()
            
            guard let data = data, let decoded = try? decoder.decode(Search.self, from: data), decoded.response else {
                let error = APIError(message: "Something went wrong with the HTTP request.")
                completion(.failure(error))
                return
            }
            
            guard decoded.response else {
                let error = APIError(message: decoded.error ?? "Something went wrong with the HTTP request.")
                completion(.failure(error))
                return
            }
            
            completion(.success(decoded))
            
        }
        
        task.resume()
    }
}

struct APIError: Error {
    let message: String
}
