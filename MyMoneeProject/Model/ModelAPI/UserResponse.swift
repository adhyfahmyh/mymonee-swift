//
//  UserResponse.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct UserResponse: Codable {
    var id: String?
    var name: String?
    var balance: Decimal?
    var displayPicture: String?
}

var myUser: [UserResponse] = []
