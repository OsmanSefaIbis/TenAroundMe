//
//  NetworkAdapter+Extension.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

extension NetworkAdapter {

    func composeRequest(endpoint: GeocodingSearchAPI , queryType: RequestQuery) -> URLRequest? {
        
        var baseUrl, path: String
        switch queryType.endpoint {
            case .browse, .autoSuggest, .lookUpById:
                guard let endpointType = queryType.endpoint,
                      let endpointBaseUrl = endpoint.baseUrls[endpointType],
                      let endpointPath = endpoint.resourcePaths[endpointType]
                else { fatalError("Missing endpoint base URL or path") }
            baseUrl = endpointBaseUrl
            path = endpointPath
            default: fatalError("Unexpected endpoint")
        }
        
        guard var components = URLComponents(string: baseUrl) else { fatalError("Unexpected error") }
        components.path = path
        components.queryItems = endpoint.queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        guard let url = components.url else { fatalError("Unexpected error") }

        return URLRequest(url: url)
    }
    
    

    func isValidJSON(_ jsonString: String) -> Bool {
        
        if let data = jsonString.data(using: .utf8) {
            do {
                _ = try JSONSerialization.jsonObject(with: data, options: [])
                return true
            } catch {
                return false
            }
        }
        return false
    }
}


