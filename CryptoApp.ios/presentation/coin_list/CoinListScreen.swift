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
        if(vm.state.isLoading && vm.state.error.isEmpty)  {
            ZStack{
                ProgressView()
            }
        } else if(!vm.state.error.isEmpty) {
            VStack{
                Text("Something gone wrong")
                Text("\(vm.state.error)")
            }
        }else {
            ScrollView{
                LazyVStack(spacing: 0){
                    ForEach(vm.state.coins, id: \.id) { coin in
                        ListItem(coin: coin)
                        Divider()
                            .padding(.vertical, 8)
                    }
                }
            }
            
        }
    }
}

#Preview {
    CoinListScreen()
}
