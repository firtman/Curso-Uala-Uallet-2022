//
//  WalletAddViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/31/22.
//

import UIKit

class WalletAddViewController: UIViewController {
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var segmentedCurrency: UISegmentedControl!
    @IBOutlet weak var lblBalance: UITextField!
    
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
        let balance = Double(lblBalance.text!) ?? 0
        
        let currency = Currency.from(index: segmentedCurrency.selectedSegmentIndex)

        let wallet = Wallet(name: lblName.text!, balance: balance, currency: currency)
        WalletsStorage.shared.add(wallet: wallet)
        
        dismiss(animated: true)
        
        if let callback = callback {
            callback(true)
        }
    }

}
