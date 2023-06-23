//
//  Double.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 22.06.2023.
//

extension Double {
    func formatCoordinate() -> String {
        String(format: "%.3f", self)
    }

    func formatCoordinateDouble() -> Double {
        return Double(String(format: "%.5f", self)) ?? 0.0
    }
}
