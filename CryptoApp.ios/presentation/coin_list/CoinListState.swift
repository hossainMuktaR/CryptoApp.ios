//
//  CoinListState.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 7/8/24.
//

import Foundation

struct CoinListState {
    var isLoading: Bool = true
    var coins: [Coin] = []
    var error: String = ""
}
