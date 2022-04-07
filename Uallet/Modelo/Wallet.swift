//
//  Wallet.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/5/22.
//

import Foundation

struct Wallet: Codable, Equatable {
    var name: String  // ✅
    var balance: Double  // ✅
    var currency: Currency  // ✅
    
    static func == (w1: Wallet, w2: Wallet) -> Bool {
        return w1.name == w2.name
    }
}
