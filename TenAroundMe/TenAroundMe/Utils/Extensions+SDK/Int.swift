//
//  Int.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 22.06.2023.
//

extension Int {
    func formatDistance() -> String {
        if self < 1000 {
            return "\(self) m"
        } else if self < 10000 {
            let km = Double(self) / 1000.0
            return String(format: "%.2f km", km)
        } else if self < 100000 {
            let km = Double(self) / 1000.0
            return String(format: "%.1f km", km)
        } else {
            let km = Double(self) / 1000.0
            return String(format: "%.0f km", km)
        }
    }
}
