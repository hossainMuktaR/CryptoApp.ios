//
//  UrlSessionClient.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 23/8/24.
//

import Foundation

struct UrlSessionClient {
    private let client: URLSession = .shared
    
    func get<T: Codable>(url: URL) async throws -> T {
        do {
            let (data, response) = try await client.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            let result = try JSONDecoder().decode(T.self, from: data)
            
            return result
        } catch {
            print("Errorrrrr: \(error.localizedDescription)")
            if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .dataCorrupted(let context):
                        print("Data corrupted: \(context)")
                    case .keyNotFound(let key, let context):
                        print("Key '\(key)' not found: \(context)")
                    case .typeMismatch(let type, let context):
                        print("Type '\(type)' mismatch: \(context)")
                    case .valueNotFound(let value, let context):
                        print("Value '\(value)' not found: \(context)")
                    @unknown default:
                        print("Unknown decoding error: \(error)")
                    }
                }
            throw URLError(.unknown)
        }
    }
}
