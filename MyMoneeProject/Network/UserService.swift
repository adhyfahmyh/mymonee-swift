//
//  UserService.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation

class UserService{
    func loadUser(completion: @escaping (_ user: [UserResponse]) -> ()) {
        let components = URLComponents(string: "https://60a5c365c0c1fd00175f442e.mockapi.io/api/v1/users")
        if let url = components?.url {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    let usersNetwork = try? decoder.decode([UserResponse].self, from: data)
                    completion(usersNetwork ?? [])
                    print(String(data: data, encoding: String.Encoding.utf8)!)
                }
            }
            task.resume()
        }
    }
}
