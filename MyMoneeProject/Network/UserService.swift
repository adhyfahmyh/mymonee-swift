//
//  UserService.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation

class UserService{
    let url = "https://60a5c365c0c1fd00175f442e.mockapi.io/api/v1/users"
    
    let components = URLComponents(string: "https://60a5c365c0c1fd00175f442e.mockapi.io/api/v1/users")
    
    func loadUser(completion: @escaping (_ user: [UserResponse]) -> ()) {
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    let user = try? decoder.decode([UserResponse].self, from: data)
                    completion(user ?? [])
//                    print(String(data: data, encoding: String.Encoding.utf8)!)
                }
            }
            task.resume()
        }
    }
    func editUser(editModel: UserResponse, id: String) {
        guard let jsonData = try? JSONEncoder().encode(editModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }

        guard let url = URL(string: "https://60a5c365c0c1fd00175f442e.mockapi.io/api/v1/users/\(id)") else {
            print("Error: cannot create URL")
            return
        }
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        print(jsonData)
        URLSession.shared.dataTask(with: request).resume()
    }
}
