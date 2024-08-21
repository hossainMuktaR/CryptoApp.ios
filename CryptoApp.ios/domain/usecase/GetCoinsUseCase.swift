//
//  GetCoinsUseCase.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

class GetCoinsUseCase {
    private let repository: CoinRepository

    init(repository: CoinRepository) {
        self.repository = repository
    }

    func execute() async -> Resource<[Coin]> {
        do {
            let coinsDto = try await repository.getCoins()
            let coins = coinsDto.map { $0.toCoin() }
            return .success(coins)
        } catch let error as URLError {
            return .failure("Couldn't reach server. Check your internet connection.\n\(error.localizedDescription)")
        } catch {
            return .failure(error.localizedDescription)
        }
    }
}
