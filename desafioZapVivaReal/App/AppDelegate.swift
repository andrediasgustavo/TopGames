//
//  AppDelegate.swift
//  desafioZapVivaReal
//
//  Created by Mac on 05/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gameManager: GamesManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if gameManager == nil {
            self.gameManager = GamesManager()
        }
        
        self.gameManager?.start()
        
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {
        
        self.gameManager?.saveContext()
    }



}

