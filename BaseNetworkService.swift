//
//  BaseNetworkService.swift
//  BoringAPI
//
//  Created by Ярослав on 24.09.2021.
//

import Foundation

class AnyNetworkService<Model: Decodable> {
    typealias ThrowableCallback = () throws -> Model
    
    private let baseURLString = "http://www.boredapi.com/api"

    open var endpoint: String?
    
    private let decoder = JSONDecoder()
    
    func sendRequest(completion: @escaping (Result<Model, Error>) -> Void) {
        guard
            let endpoint = endpoint,
            let url = URL(string: "\(baseURLString)\(endpoint)")
        else {
            completion(.failure(URLConvertionError.failedToConvertURL))
            return
        }
        
        let task = configureTask(url: url, decoder: decoder) { callback in
            completion(
                Result {
                    try callback()
                }
            )
        }
        
        task.resume()
    }
    
    private func configureTask(
        url: URL,
        decoder: JSONDecoder,
        with completion: @escaping (_ inner: ThrowableCallback) -> Void
    ) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
             if let data = data {
                completion({
                    return try decoder.decode(Model.self, from: data)
                })
            } else if let error = error {
                completion({ throw error })
            }
        }
        
        return task
    }
}

enum URLConvertionError: Error {
    case failedToConvertURL
}

protocol ErrorConvertible: Error {
    static func error(from: Error) -> Self
}
