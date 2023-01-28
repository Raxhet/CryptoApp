//
//  Double.swift
//  Crypto
//
//  Created by Илья Меркуленко on 28.01.2023.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func doubleToCurrency() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    func doubleToString() -> String {
        return String(format: "%.2f", self)
    }
    
    func percentString() -> String {
        return doubleToString() + "%"
    }
}
