//
//  WalletDetailsViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/6/22.
//

import UIKit

class WalletDetailsViewController: UIViewController {

    var wallet: Wallet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = wallet?.name
    }


}
