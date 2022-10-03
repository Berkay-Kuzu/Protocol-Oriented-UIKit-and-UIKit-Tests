//
//  API Manager.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Kuzu on 28.09.2022.
//

import Foundation

class APIManager: UserService {
    
    /*
    static let shared = APIManager()
    private init () {}
    */
    
    func fetchUser (completion : @escaping(Result<User,Error>) -> Void ) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
          fatalError("Wrong Url!")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
            
        }.resume() // URLSession'ın sonuna yazdım.
        
    }
    
}
