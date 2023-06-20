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
    
    // TODO: add more fetches
    
    func fetchSearch(
        by query: SearchQuery,
        onCompletion: @escaping (Result <SearchDTO, NetworkError> ) -> Void
    ) {
        
        let type: RequestQuery = .init(search: query, endpoint: .browse)
        guard let searchUrl = composeRequest(
            endpoint: .browse(searchInput: query.input ?? "", location: query.location),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: SearchDTO.self, onCompletion: onCompletion)
    }
    
    func fetchLookUp(
        with id: String,
        onCompletion: @escaping (Result <DetailDTO, NetworkError> ) -> Void
    ) {
        
        let type: RequestQuery = .init(id: id, endpoint: .lookUpById)
        guard let searchUrl = composeRequest(
            endpoint: .lookUpById(id: id),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: DetailDTO.self, onCompletion: onCompletion)
    }
    
    func fetchSuggestion(
        by query: SearchQuery,
        onCompletion: @escaping (Result <SuggestDTO, NetworkError> ) -> Void
    ) {
        
        let type: RequestQuery = .init(search: query, endpoint: .autoSuggest)
        guard let searchUrl = composeRequest(
            endpoint: .autoSuggest(suggestInput: query.input ?? "", location: query.location),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: SuggestDTO.self, onCompletion: onCompletion)
    }
    
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


