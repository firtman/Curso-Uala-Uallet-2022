//
//  MainTabViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func loadView() {
        // Al implementar este método, sobreescribimos el XIB
        super.loadView()
        
        self.tabBar.tintColor = UIColor(named: "TintaTabs")
//        self.tabBar.isTranslucent = false
//        self.tabBar.backgroundColor = UIColor.white
        
        // SF Symbols
        
        let homeVC = HomeViewController()
        let homeIcono = UIImage(systemName: "house.fill")
        let homeNavigationVC = UINavigationController(rootViewController: homeVC)
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: homeIcono, selectedImage: nil)
        
        let dashboardVC = DashboardViewController()
        dashboardVC.title = "Dashboard"
        let dashboardNavigationVC = UINavigationController(rootViewController: dashboardVC)
        let dashboardIcon = UIImage(systemName: "chart.pie.fill")
        dashboardNavigationVC.tabBarItem = UITabBarItem(title: "Dashboard", image: dashboardIcon, selectedImage: nil)
        
        let walletsVC = WalletsViewController()
        let walletsNavigationVC = UINavigationController(rootViewController: walletsVC)

        let walletsIcon = UIImage(systemName: "creditcard.circle.fill")
        walletsNavigationVC.tabBarItem = UITabBarItem(title: "Wallets", image: walletsIcon, selectedImage: nil)
        
        let infoIcon = UIImage(systemName: "info.circle.fill")
        let infoVC = InfoViewController()
        infoVC.tabBarItem = UITabBarItem(title: "Info", image: infoIcon, selectedImage: nil)
        
        self.viewControllers = [homeNavigationVC, dashboardNavigationVC, walletsNavigationVC, infoVC]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
