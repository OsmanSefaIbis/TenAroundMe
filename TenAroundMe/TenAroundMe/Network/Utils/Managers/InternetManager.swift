//
//  InternetManager.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//
import Foundation
import Network

final class InternetManager {
    static let shared = InternetManager()
    
    private var monitor: NWPathMonitor?
    
    private init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor?.start(queue: queue)
    }
    
    func isOnline() -> Bool {
        guard let monitor = monitor else {
            return false
        }
        
        let status = monitor.currentPath.status
        return status == .satisfied
    }
}
