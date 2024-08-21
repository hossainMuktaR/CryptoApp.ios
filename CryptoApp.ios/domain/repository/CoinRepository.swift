//
//  CoinRepository.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation


//interface CoinRepository {
//
//    suspend fun getCoins(): List<CoinDto>
//
//    suspend fun getCoinById(coinId: String): CoinDetailDto
//}

protocol CoinRepository {
    
    func getCoins() async throws -> [CoinDto]
}
