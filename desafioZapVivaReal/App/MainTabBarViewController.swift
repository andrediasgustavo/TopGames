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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers?.forEach {
            if let navController = $0 as? UINavigationController {
                navController.topViewController?.view
            } else {
                $0.view.description
            }
        }
    }
}
