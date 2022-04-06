//
//  Currency.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/5/22.
//

import Foundation

enum Currency: String, Codable {
   case Pesos = "Pesos"
   case Dollar = "Dólares"
   case Bitcoin = "Bitcoin"
    
   
    static func from(index: Int) -> Currency {
        switch index {
        case 0:
            return .Pesos
        case 1:
            return .Dollar
        default:
            return .Bitcoin
        }
    }
}
