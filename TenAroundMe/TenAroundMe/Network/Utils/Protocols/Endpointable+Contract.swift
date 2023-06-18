//
//  Endpointable+Contract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

public typealias QueryParameters = [String : Any]
public typealias Endpoints = [EndpointTypes : String]

public protocol Endpointable {
    
    var baseUrls: Endpoints { get }
    var resourcePaths: Endpoints { get }
    var request: RequestType { get }
    var queryParams: QueryParameters { get }
}

