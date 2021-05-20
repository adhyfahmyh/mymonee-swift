//
//  User.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import Foundation

//struct User: Codable {
//    var id: Int
//    var name: String?
//    var balance: Decimal?
//    var displayPicture: String?
//}
//
//var balanceTotal = (wallets[0].totalMoneyIn ?? 0) - (wallets[0].totalMoneyOut ?? 0)
//var users: [User] =
//    [
//        User(id: 1, name: "Arthur Morgan", balance: ((wallets[0].totalMoneyIn ?? 0) - (wallets[0].totalMoneyOut ?? 0)), displayPicture: "arthur_morgan_red")
//    ]

struct AllUsers: Codable {
    var results: [User]?
}

struct User: Codable {
    var id: Int?
    var name: String?
    var balance: Decimal?
    var displayPicture: String?
}

var users: [User] =
    [
        User(id: 1, name: "Arthur Morgan", balance: ((wallets[0].totalMoneyIn ?? 0) - (wallets[0].totalMoneyOut ?? 0)), displayPicture: "arthur_morgan_red")
    ]
