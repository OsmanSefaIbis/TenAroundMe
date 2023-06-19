//
//  String.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import Foundation

extension String {
    var numberFormatter: String {
        return replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
    }
}
