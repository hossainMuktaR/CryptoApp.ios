//
//  getCoinByIdUseCase.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 24/8/24.
//

import Foundation

class GetCoinByIdUseCase {
    private let repository: CoinRepository

    init(repository: CoinRepository) {
        self.repository = repository
    }

    func execute(coinId: String) async -> Resource<CoinDetail> {
        do {
            let coinDto = try await repository.getCoinById(coinId: coinId )
            let coin = coinDto.toCoinDetail()
            return .success(coin)
        } catch let error as URLError {
            return .failure("Couldn't reach server. Check your internet connection.\n\(error.localizedDescription)")
        } catch {
            return .failure(error.localizedDescription)
        }
    }
}
