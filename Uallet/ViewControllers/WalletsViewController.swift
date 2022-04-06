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
    let cellBitcoinIdentifier = "celdaWalletsBitcoin"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        title = "Wallets"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))
        
        
        // Registrar una celda custom genérica
        let nib = UINib(nibName: "WalletCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // Registrar una celda custom para el caso Bitcoin
        let nibBitcoin = UINib(nibName: "WalletBitcoinCell", bundle: nil)
        tableView.register(nibBitcoin, forCellReuseIdentifier: cellBitcoinIdentifier)

        
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
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Apretaste en la fila \(indexPath.row)")
        
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        let detailsVC = WalletDetailsViewController()
        detailsVC.wallet = wallet
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        if wallet.currency == .Bitcoin {
            return 130
        } else {
            return 130
        }
    }
    
    // se ejecuta varias veces, una por cada celda que hay que dibujar
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var currentCellIdentifier = cellIdentifier // celda genérica
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        if wallet.currency == .Bitcoin {
            currentCellIdentifier = cellBitcoinIdentifier // celda de bitcoin
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellIdentifier,
                                                 for: indexPath) as! WalletCell
        
        cell.lblNombre.text = wallet.name
        cell.lblSaldo.text = "\(wallet.balance)"
        // Modo 1
        if let lblMoneda = cell.lblMoneda {
            lblMoneda.text = wallet.currency.rawValue
        }
        // Modo 2
        cell.lblMoneda?.text = wallet.currency.rawValue
        return cell
    }

    
}
