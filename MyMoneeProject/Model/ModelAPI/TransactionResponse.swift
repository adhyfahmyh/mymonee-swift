//
//  TransactionResponse.swift
//  MyMoneeProject
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct TransactionResponse: Codable {
    var id: String?
    var date: String?
    var usageTitle: String?
    var usageAmount: Decimal?
    var status: String?
}

var transaction: [TransactionResponse] = []
