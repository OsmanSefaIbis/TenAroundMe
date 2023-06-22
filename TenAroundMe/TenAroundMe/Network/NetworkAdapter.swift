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
        onCompletion: @escaping (Result <PlacesDTO, NetworkError> ) -> Void
    ) {
        let type: RequestQuery = .init(search: query, endpoint: .browse)
        guard let location = query.location else { return }
        guard let searchUrl = composeRequest(
            endpoint: .browse(searchInput: query.input ?? "", location: location , country: query.country ?? ""),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: PlacesDTO.self, onCompletion: onCompletion)
    }
    func fetchLookUp(
        by query: SearchQuery,
        onCompletion: @escaping (Result <DetailDTO, NetworkError> ) -> Void
    ) {
        let type: RequestQuery = .init(id: query.id, endpoint: .lookUpById)
        guard let searchUrl = composeRequest(
            endpoint: .lookUpById(id: query.id ?? "", country: query.country ?? ""),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: DetailDTO.self, onCompletion: onCompletion)
    }
    
    func fetchSuggestion(
        by query: SearchQuery,
        onCompletion: @escaping (Result <SuggestDTO, NetworkError> ) -> Void
    ) {
        
        let type: RequestQuery = .init(search: query, endpoint: .autoSuggest)
        guard let location = query.location else { return }
        guard let searchUrl = composeRequest(
            endpoint: .autoSuggest(suggestInput: query.input ?? "", location: location, country: query.country ?? ""),
            queryType: type )
        else { onCompletion(.failure(.invalidRequest)) ; return }
        
        execute(request: searchUrl, dto: SuggestDTO.self, onCompletion: onCompletion)
    }
    
    func fetchSuggestionSearch(
            by query: SearchQuery,
            onCompletion: @escaping (Result <PlacesDTO, NetworkError> ) -> Void
        ) {
            guard let hrefCategoryUrl = query.hrefCategory else { return }
            let hrefUrl = hrefCategoryUrl.appending("&apiKey=\(AppConstants.apiKey)")
            guard let url = URL(string: hrefUrl) else { return }
            let request = URLRequest(url: url)
            execute(request: request, dto: PlacesDTO.self, onCompletion: onCompletion)
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


