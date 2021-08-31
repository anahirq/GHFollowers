//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 24/08/21.
//

import UIKit

class NetworkManager {
    static let shared  = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    
    //create cache
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //If the error exist
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            //Handle the response
            //The 200 means that everything is ok
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))  
            }
        }
        
        
        
        //start the network call
        task.resume()
    }
}
