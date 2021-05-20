//
//  Wallet.swift
//  MyMoneeProject
//
//  Created by MacBook on 14/05/21.
//

import Foundation
struct Wallet {
    var id: Int? = nil
    var userId: Int? = nil
    var totalMoneyIn: Decimal? = 0
    var totalMoneyOut: Decimal? = 0
    
}

var wallets: [Wallet] =
    [
//        Wallet(id: 1, userId: 1, totalMoneyIn: 1000000, totalMoneyOut: 100000)
        Wallet(id: 1, userId: 1, totalMoneyIn: 0, totalMoneyOut: 0)
    ]

