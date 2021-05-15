//
//  Dream.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import Foundation
struct Dream {
    var id: Int?
    var dreamTitle: String?
    var dreamCurrentAmount: Decimal?
    var dreamTargetAmount: Decimal?
}


var dream: [Dream] =
    [
        Dream(id: 1, dreamTitle: "Mobil", dreamCurrentAmount: 1000000, dreamTargetAmount: 100000000),
        Dream(id: 2, dreamTitle: "Sepatu", dreamCurrentAmount: 1000000, dreamTargetAmount: 500000)
    ]
