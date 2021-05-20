//
//  WalletResponse.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation
struct WalletResponse: Codable {
    var id: Int? = nil
    var userId: Int? = nil
    var totalMoneyIn: Decimal? = 0
    var totalMoneyOut: Decimal? = 0
    
}

var myWallet: [WalletResponse] = []
