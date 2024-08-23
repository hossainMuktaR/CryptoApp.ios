//
//  CoinPaprikaApiImpl.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

class CoinPaprikaApiImpl: CoinPaprikaApi {
    
    private let client: UrlSessionClient
    
    init(client: UrlSessionClient = UrlSessionClient()) {
        self.client = client
    }
    
    func getCoins() async throws -> [CoinDto] {
        do {
            let url = URL(string: CoinPaprikaRoutes.GET_COINS)!
            return try await client.get(url: url) as [CoinDto]
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func getCoinById(coinId: String) async throws -> CoinDetailDto {
        do {
            let url = URL(string: CoinPaprikaRoutes.GET_COINS + "/\(coinId)")!
            print("\(url)")
            return try await client.get(url: url) as CoinDetailDto
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    
}
