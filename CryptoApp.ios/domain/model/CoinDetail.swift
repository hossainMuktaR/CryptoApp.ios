//
//  CoinDetail.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 7/8/24.
//

import Foundation

struct CoinDetail {
    let coinId: String
    let name: String
    let description: String
    let symbol: String
    let rank: Int
    let isActive: Bool
    let tags: [String]
    let team: [TeamMember]
}
