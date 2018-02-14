//
//  OfflineViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 14/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class OfflineViewController: UIViewController {
    
    let network = NetworkManager.sharedInstance
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        network.reachability.whenReachable = { _ in
            self.showMainController()
        }
    }
    
    private func showMainController() -> Void {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
