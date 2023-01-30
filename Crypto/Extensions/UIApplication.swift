//
//  UIApplication.swift
//  Crypto
//
//  Created by Илья Меркуленко on 30.01.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
