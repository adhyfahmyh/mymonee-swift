//
//  DateTime.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import Foundation

//func dateTime() -> String {
//
//    let currentDate = Date()
//    let formatter = DateFormatter()
//
//    formatter.locale = Locale(identifier: "id")
//    formatter.timeStyle = .short
//    formatter.dateStyle = .long
//
//    let dateTimeString = formatter.string(from: currentDate)
//
//    return dateTimeString
//
//}

extension Date {
    var dateTime: String{
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "id")
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        
        let dateTimeString = formatter.string(from: self)
        
        return dateTimeString
        
    }
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
}
