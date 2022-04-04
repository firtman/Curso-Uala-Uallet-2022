//
//  WalletAddViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/31/22.
//

import UIKit

class WalletAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Wallet"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))

        // Do any additional setup after loading the view.
    }

    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func save() {
        dismiss(animated: true)
    }

}
