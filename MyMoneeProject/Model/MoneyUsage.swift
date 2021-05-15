//
//  MoneyUsage.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import Foundation

struct MoneyUsage {
    var id: Int?
    var status: Bool = false
    var usageTitle: String?
    var date: String?
    var usageAmount: String?
    
}

var moneyUsage: [MoneyUsage] =
    [
        MoneyUsage(id: 1, status: true, usageTitle: "Bayar Listrik", date: "now", usageAmount: "1.000.000"),
        MoneyUsage(id: 2, status: false, usageTitle: "Bayar Listrik", date: "now", usageAmount: "1.000.000")
    ]
