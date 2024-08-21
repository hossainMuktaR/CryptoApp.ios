//
//  CoinDto.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation


struct CoinDto: Codable {
    let id: String
    let isActive: Bool
    let isNew: Bool
    let name: String
    let rank: Int
    let symbol: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "is_active"
        case isNew = "is_new"
        case name
        case rank
        case symbol
        case type
    }
}

extension CoinDto {
    func toCoin() -> Coin {
        return Coin(id: self.id, isActive: self.isActive, name: self.name, rank: self.rank, symbol: self.symbol)
    }
}
