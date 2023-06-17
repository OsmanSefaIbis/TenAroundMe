//
//  NetworkAdapter.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import Foundation

final class NetworkAdapter {
    
    private var session: URLSession { URLSession.shared }
    static let shared = NetworkAdapter()
    
    // TODO: ADD url constructing methods that are relevant to the API, then feed it to execute

    private func execute<T: Decodable>(
        request: URLRequest,
        dto: T.Type,
        decoder: JSONDecoder = JSONDecoder(),
        onCompletion: @escaping (Result<T, NetworkError>) -> Void
    ) {

        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error as Error? {
                onCompletion(.failure(.url(error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                onCompletion(.failure(.unresolved(error)))
                return
            }
            guard let data = data else {
                onCompletion(.failure(.unresolved(error)))
                return
            }
            let statusCode = httpResponse.statusCode
            if statusCode >= 200 && statusCode < 300 {
                do {
                    let jsonString = String(data: data, encoding: .utf8)
                    if let jsonString = jsonString, self.isValidJSON(jsonString) {
                        let result = try decoder.decode(dto, from: data)
                        onCompletion(.success(result))
                    } else {
                        onCompletion(.failure(.json(error)))
                    }
                } catch {
                    onCompletion(.failure(.decode(error)))
                }
            } else {
                onCompletion(.failure(.http(statusCode)))
            }
        }
        task.resume()
    }
}


