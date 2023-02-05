//
//  StatisticModel.swift
//  Crypto
//
//  Created by Илья Меркуленко on 31.01.2023.
//

import Foundation

struct StatisticModel: Identifiable {
    var id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}
