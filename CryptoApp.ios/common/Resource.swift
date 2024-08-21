//
//  Resource.swift
//  CryptoApp.ios
//
//  Created by Hossain Muktar on 14/8/24.
//

import Foundation

enum Resource<T> {
    case loading
    case success(T)
    case failure(String)
}
