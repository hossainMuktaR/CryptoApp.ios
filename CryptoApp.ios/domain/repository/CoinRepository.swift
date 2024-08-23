//
//  CoinRepository.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

protocol CoinRepository {
    
    func getCoins() async throws -> [CoinDto]
    func getCoinById(coinId: String) async throws -> CoinDetailDto
}
