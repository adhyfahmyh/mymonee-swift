//
//  WalletResponse.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct WalletResponse: Codable {
    var id: String?
    var userId: String?
    var totalMoneyIn: Decimal?
    var totalMoneyOut: Decimal?    
}

var myWallet: [WalletResponse] = []
