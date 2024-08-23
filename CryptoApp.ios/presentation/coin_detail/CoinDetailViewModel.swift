//
//  CoinDetailViewModel.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 24/8/24.
//

import Foundation

@Observable
class CoinDetailViewModel {
    private let api: CoinPaprikaApi = CoinPaprikaApiImpl()
    private let repository: CoinRepository
    private let getCoinByIdUseCase: GetCoinByIdUseCase
    
    var state = CoinDetailState()
    
    init(coinId: String) {
        self.repository = CoinRepositoryImpl(api: api)
        self.getCoinByIdUseCase = GetCoinByIdUseCase(repository: self.repository)
    }
    
    func getCoinById(coinId: String) {
        print("vm: getCoinById Called")
        Task {
            let result = await self.getCoinByIdUseCase.execute(coinId: coinId)
            switch(result) {
            case .loading :
                print("vm: getCoinById .loading called")
                self.state = CoinDetailState(isLoading: true)
            case .failure(let e):
                self.state = CoinDetailState(isLoading: false, error: e)
            case .success(let CoinDetail):
                self.state = CoinDetailState(
                    isLoading: false,
                    coin: CoinDetail,
                    error: "")
            }
        }
    }
}
