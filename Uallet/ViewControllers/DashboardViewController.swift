//
//  DashboardViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit
import PromiseKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblBalance: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // actualiza balance si hay cambio en los datos
        WalletsStorage.shared.addDataChanged {
            self.updateBalance()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // actualizar balance si hubiera cambio en cotizaciones
        updateBalance() // por si cambian las cotizaciones
    }

    func updateBalance() {
        self.lblBalance.text = "⌛️"
        firstly {
            when(fulfilled:
                    APICotizaciones.bitcoinRatePromises(),
                    APICotizaciones.dolarBlueRatePromises(),
                    WalletsStorage.shared.walletsPromise()
            )
        }
        .done { (rateBitcoin, rateDolar, wallets) in
            var suma: Double = 0
            for wallet in wallets {
                switch wallet.currency {
                case .Pesos:
                    suma += wallet.balance / rateDolar.compra
                case .Dollar:
                    suma += wallet.balance
                case .Bitcoin:
                    suma += wallet.balance * rateBitcoin
                }
            }
            self.lblBalance.text = "US$ \(Int(suma))"
            
            
        }
        .catch { error in
            self.lblBalance.text = "Error"
        }
    }

}
