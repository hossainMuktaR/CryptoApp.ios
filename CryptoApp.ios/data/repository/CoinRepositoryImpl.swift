//
//  CoinRepositoryImpl.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

class CoinRepositoryImpl: CoinRepository {
    private let api: CoinPaprikaApi
    
    init(api: CoinPaprikaApi) {
        self.api = api
    }
    
    func getCoins() async throws -> [CoinDto] {
        return try await api.getCoin()
    }
}
