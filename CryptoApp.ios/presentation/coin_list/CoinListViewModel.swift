//
//  CoinListViewModel.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 7/8/24.
//

import Foundation

@Observable
class CoinListViewModel{
    private let api: CoinPaprikaApi = CoinPaprikaApiImpl()
    private let repository: CoinRepository
    private let getCoinUseCase: GetCoinsUseCase
    
    var state = CoinListState()
    
    init() {
        self.repository = CoinRepositoryImpl(api: api)
        self.getCoinUseCase = GetCoinsUseCase(repository: self.repository)
        getCoins()
    }
    
    private func getCoins() {
        print("vm: getCoins Called")
        Task {
            let result = await getCoinUseCase.execute()
            switch(result) {
            case .loading :
                print("vm: getCoins: .loading Called")
                self.state = CoinListState(isLoading: true)
            case .failure(let e) :
                self.state = CoinListState(isLoading: false, error: e)
                print("vm: getCoins: .failure Called")
            case .success(let coins):
                self.state = CoinListState(isLoading: false, coins: Array(coins.prefix(100)), error: "")
                print("vm: getCoins: .success Called")
                print("vm: getCoins: .success: \(coins.count)")
                print("vm: getCoins: .success: \(Array(coins.prefix(100)).count)")


            }
        }
    }
}
