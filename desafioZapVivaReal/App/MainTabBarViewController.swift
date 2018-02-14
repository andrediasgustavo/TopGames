//
//  MainTabBarViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 14/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    let network: NetworkManager = NetworkManager.sharedInstance
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NetworkManager.isUnreachable { _ in
            self.showOfflinePage()
        }
        
        NetworkManager.isReachable { _ in
            self.viewControllers?.forEach {
                if let navController = $0 as? UINavigationController {
                    navController.topViewController?.view
                } else {
                    $0.view.description
                }
            }
        }
    }
    
    private func showOfflinePage() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
        }
    }
}
