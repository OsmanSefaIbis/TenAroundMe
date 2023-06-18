//
//  InternetManager.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//
import Foundation

import SystemConfiguration

final class InternetManager{
    
    static var shared = InternetManager()
    
    func isOnline() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false { return false }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
                
        return isReachable && !needsConnection
    }
}

// TODO: Replace with above


//
//import Network
//
//final class InternetManager {
//    static let shared = InternetManager()
//
//    private var monitor: NWPathMonitor?
//
//    private init() {
//        startMonitoring()
//    }
//
//    private func startMonitoring() {
//        monitor = NWPathMonitor()
//        let queue = DispatchQueue(label: "NetworkMonitor")
//        monitor?.start(queue: queue)
//    }
//
//    func isOnline() -> Bool {
//        guard let monitor = monitor else {
//            return false
//        }
//
//        let status = monitor.currentPath.status
//        return status == .satisfied
//    }
//}
