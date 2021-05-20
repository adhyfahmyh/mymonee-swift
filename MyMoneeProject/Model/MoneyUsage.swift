//
//  MoneyUsage.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import Foundation

enum moneyStatus {
    case moneyIn
    case moneyOut
}

struct MoneyUsage {
    var id: Int?
    var status: moneyStatus
    var usageTitle: String?
    var date: String?
    var usageAmount: Decimal?
}

var moneyUsage: [MoneyUsage] = []
//    [
//        MoneyUsage(id: 1, status: .moneyIn, usageTitle: "THR", date: "12 Mei 2021 07.00", usageAmount: 1000000),
//        MoneyUsage(id: 2, status: .moneyOut, usageTitle: "Bayar Listrik", date: "12 Mei 2021 13.00", usageAmount: 100000)
//    ]


