//
//  NetworkManager.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import Foundation

struct NetworkManager {

    static let shared = NetworkManager()

    private init() { }

    func fetchData<T: Codable>(from jsonFile: String, resultType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: jsonFile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
