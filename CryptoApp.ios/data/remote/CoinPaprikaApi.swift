//
//  CoinPaprikaApi.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

protocol CoinPaprikaApi {
    func getCoin() async throws -> [CoinDto]
}
