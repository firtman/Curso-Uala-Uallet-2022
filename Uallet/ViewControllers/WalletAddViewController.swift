//
//  WalletAddViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/31/22.
//

import UIKit

class WalletAddViewController: UIViewController {
    
    var callback: ((Bool) -> Void)?
    
    func set(callback: @escaping (Bool)->Void) {
        self.callback = callback
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Wallet"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))

        // Do any additional setup after loading the view.
    }

    @objc func cancel() {
        dismiss(animated: true)
        
        if let callback = callback {
            callback(false)
        }
    }
    
    @objc func save() {
        //TODO: Grabar datos reales
        let wallet = Wallet(name: "Nuevo", balance: 200, currency: .Dollar)
        WalletsStorage.shared.add(wallet: wallet)
        
        dismiss(animated: true)
        
        if let callback = callback {
            callback(true)
        }
    }

}
