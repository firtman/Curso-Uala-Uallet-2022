//
//  DolarRate.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/5/22.
//

import Foundation

struct DolarRate {
    var compra: Double
    var venta: Double
    
    var description: String {
        get {
            return "Compra: \(self.compra), Venta: \(self.venta)"
        }
    }
}
