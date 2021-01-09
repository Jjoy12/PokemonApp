//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Jerrion Joy on 1/8/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    struct PokData: Codable{
        var count: Int
        var next: String
    }
    
    var count = 0
    
    public init(){}
    
    func getData(completed: @escaping ([PokData]?, ErrorHandl?) -> Void){
        
        let endpoint = baseURL
        
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidJSON)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error  {
                completed(nil, .invalidJSON)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidJSON)
                return
            }
            guard let data = data else {
                completed(nil, .invalidJSON)
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([PokData]?.self, from: data)
                completed(response,.invalidJSON)

                
            }catch {
                completed(nil, .invalidJSON)
                 
                
            }
            
        }
        task.resume()
       
        
        
        
        
    }
}
