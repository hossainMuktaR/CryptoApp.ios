//
//  CoinListScreen.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 7/8/24.
//

import SwiftUI

struct CoinListScreen: View {
    @State var vm = CoinListViewModel()
    var body: some View {
        ZStack{
            if vm.state.isLoading {
                ProgressView()
            } else if let coins = vm.state.coins {
                NavigationStack{
                    ScrollView{
                        LazyVStack(spacing: 0){
                            ForEach(coins, id: \.id) { coin in
                                NavigationLink(destination: CoinDetailScreen(coinId: coin.id)){
                                    ListItem(coin: coin)
                                }
                                Divider()
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .navigationTitle("Coin List")
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else if let error = vm.state.error {
                VStack{
                    Text("Something gone wrong")
                    Text("\(error)")
                }
            }
        }.onAppear {
            vm.getCoins()
        }
    }
}

//#Preview {
//    CoinListScreen()
//}
