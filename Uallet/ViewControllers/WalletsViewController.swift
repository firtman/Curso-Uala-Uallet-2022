//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit


class WalletsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wallets"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))
                        
        // Do any additional setup after loading the view.
    }

    @objc func addWallet() {
        let addVC = WalletAddViewController()
//        addVC.modalTransitionStyle = .crossDissolve
//        addVC.modalPresentationStyle = .fullScreen
        present(UINavigationController(rootViewController: addVC), animated: true)
        
                
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
