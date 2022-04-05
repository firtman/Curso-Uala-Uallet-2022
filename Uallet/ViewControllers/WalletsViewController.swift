//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 4/5/22.
//

import UIKit

class WalletsViewController: UITableViewController {
    
    // - MARK: Inicio
    
    let cellIdentifier = "celdaWallets"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        title = "Wallets"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))
        
        
        // Registrar una celda custom
        let nib = UINib(nibName: "WalletCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        
        
    }
    
    
    // MARK: - Eventos de UI
    
    @objc func addWallet() {
        let addVC = WalletAddViewController()
        addVC.set { grabo in
            if grabo {
                self.tableView.reloadData()
            }
        }
        present(UINavigationController(rootViewController: addVC), animated: true)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }

    
    // se ejecuta varias veces, una por cada celda que hay que dibujar
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath) as! WalletCell
        
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        cell.textLabel!.text = wallet.name
            
        return cell
    }

    
}
