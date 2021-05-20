//
//  CategorySelection.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import Foundation

struct Category {
    var iconCategory: String
    var lblCategory: String
    var categoryVal: moneyStatus
}

var categories =
    [
        Category(iconCategory: "arrow_up", lblCategory: "Pemasukan", categoryVal: .moneyIn),
        Category(iconCategory: "arrow_down", lblCategory: "Pengeluaran", categoryVal: .moneyOut)
    ]

