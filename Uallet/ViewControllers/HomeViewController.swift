//
//  HomeViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/29/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblInfo: UILabel!
    
    @objc func logout() {
        UserDefaults.standard.set(false, forKey: "logueado")
        dismiss(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logout))
        
        updateInfo()
        
        WalletsStorage.shared.addDataChanged {
            self.updateInfo()
        }
    }
    
    
    func updateInfo() {
        lblInfo.text = "Hay \(WalletsStorage.shared.wallets.count) wallet(s)"
    }
    
    
    func cerrar() {
        dismiss(animated: true) {
            print("cerré la ventana")
        }
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
