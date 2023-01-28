//
//  Color.swift
//  Crypto
//
//  Created by Илья Меркуленко on 27.01.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background  = Color("BackgroundColor")
    let negative = Color("NegativeColor")
    let positive = Color("PositiveColor")
    let secondaryText = Color("SecondaryTextColor")
}
