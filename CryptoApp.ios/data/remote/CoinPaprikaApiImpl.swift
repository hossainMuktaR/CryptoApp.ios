//
//  CoinPaprikaApiImpl.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

class CoinPaprikaApiImpl: CoinPaprikaApi {
    
    private let client: URLSession
    
    init(client: URLSession = .shared) {
        self.client = client
    }
    
    func getCoin() async throws -> [CoinDto] {
        do {
            let url = URL(string: CoinPaprikaRoutes.GET_COINS)!
            let (data, response) = try await client.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            let coins = try JSONDecoder().decode([CoinDto].self, from: data)
            return coins
        } catch {
            print("Error: \(error.localizedDescription)")
            return []
        }
    }
}
