//
//  Wallet.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/5/22.
//

import Foundation

struct Wallet: Codable {
    var name: String  // ✅
    var balance: Double  // ✅
    var currency: Currency  // ✅
}
