//
//  Storage.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/29/22.
//


// singleton: shared, standard, current

import Foundation
import UIKit

class Storage {
    static func grabar() {
        let defaults = UserDefaults.standard
        defaults.set(365, forKey: "cantidad_dias")
    }
    
    static func leer() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "cantidad_dias")
    }
}
