//
//  CoinDetailScreen.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 23/8/24.
//

import SwiftUI

struct CoinDetailScreen: View {
    private let coinId: String
    @State private var vm: CoinDetailViewModel
    
    init(coinId: String) {
        self.coinId = coinId
        _vm = State(initialValue: CoinDetailViewModel(coinId: coinId))
    }
    
    var body: some View {
        ZStack{
            if vm.state.isLoading {
                ProgressView()
            } else if let coin = vm.state.coin {
                CoinDetailPage(coin: coin)
                    .navigationTitle(coin.name)
                    .navigationBarTitleDisplayMode(.inline)
            } else if let error = vm.state.error {
                VStack{
                    Text("Something gone wrong")
                    Text("\(vm.state.error)")
                }
            }
        }.onAppear {
            vm.getCoinById(coinId: coinId)
        }
    }
}


