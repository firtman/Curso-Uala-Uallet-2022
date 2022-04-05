//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit


class WalletsViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wallets"
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))
    }

    @objc func addWallet() {
        let addVC = WalletAddViewController()
        present(UINavigationController(rootViewController: addVC), animated: true)
        
                
    }

    
    
    fileprivate func crearElementosManual() {
        let stack = UIStackView(frame: CGRect(x: 15, y: 80, width: 300, height: 300))
        stack.axis = .vertical
        self.view.addSubview(stack)
        
        for wallet in WalletsStorage.shared.wallets {
            let label = UILabel()
            label.text = wallet.name
            stack.addSubview(label)
        }
    }
    
}
