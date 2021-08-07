//
//  NetworkManager.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    // MARK: - Network Call
    typealias NetworkResult<U> = (Result<U, Error>) -> Void where U: Decodable
    
    func getData<T: Decodable>(from urlString: String, responseModel: T.Type, completion: @escaping NetworkResult<T>) {
        guard let url = URL(string: urlString) else { return }
        print(url.absoluteString)
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(responseModel.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}
