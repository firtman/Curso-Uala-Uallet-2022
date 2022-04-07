//
//  WalletDetailsViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/6/22.
//

import UIKit

class WalletDetailsViewController: UIViewController {

    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var txtBalance: UITextField!
    
    var wallet: Wallet?
        
    @IBAction func deleteWallet(_ sender: Any) {
        let alert = UIAlertController(title: "Eliminar Wallet", message: "¿Estás seguro/a que querés eliminar la wallet? No se puede recuperar", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "SI, eliminar", style: .destructive, handler: { _ in
            WalletsStorage.shared.delete(wallet: self.wallet!)
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "NO, Cancelar", style: .cancel))
        present(alert, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        WalletsStorage.shared.editBalance(wallet: self.wallet!, balance: Double(txtBalance.text!) ?? 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = wallet?.name
        lblCurrency.text = wallet?.currency.rawValue
        let balance = wallet?.balance ?? 0
        txtBalance.text = "\(balance)"
    }


}
