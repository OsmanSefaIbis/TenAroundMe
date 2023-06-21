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
    
    func capitalizeFirstCharacter() -> String {
        guard let firstCharacter = self.first else {
            return self
        }
        if firstCharacter.isLowercase {
            return firstCharacter.uppercased() + self.dropFirst()
        }
        return self
    }
}
