//
//  CoreDataManager.swift
//  desafioZapVivaReal
//
//  Created by Mac on 14/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    var appDelegate: AppDelegate
    var managedContext: NSManagedObjectContext

    override init() {
        self.appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        self.managedContext = self.appDelegate.persistentContainer.viewContext
        super.init()
    }
    
    func fetchDataBase() -> [NSManagedObject] {
        
        var gamesDataBase = [NSManagedObject]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "GameEntity")
        
        do {
            gamesDataBase = try! self.managedContext.fetch(fetchRequest)
        } catch let error as Error {
            print("Could not fetch. \(error), \(error.localizedDescription)")
        }

        return gamesDataBase
    }
    
    
    func saveInDataBase(game: Game) {
        
        var gamesDataBase = [NSManagedObject]()
        
        let entity = NSEntityDescription.entity(forEntityName: "GameEntity", in: self.managedContext)!
        
        let gameObject = NSManagedObject(entity: entity, insertInto: self.managedContext)
        
        gameObject.setValue(game.gameName?.name, forKeyPath: "gameName")
        gameObject.setValue(game.gameImageList?.boxImages?.bannerMedium, forKeyPath: "gameImage")
        gameObject.setValue(true, forKey: "isFavorite")
        
        do {
            try self.managedContext.save()
            gamesDataBase.append(gameObject)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func deleteGame(game: NSManagedObject) {
        let entity = NSEntityDescription.entity(forEntityName: "GameEntity", in: self.managedContext)!
        let gameObject = NSManagedObject(entity: entity, insertInto: self.managedContext)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameEntity")
        if let fetchResults = try? self.managedContext.fetch(fetchRequest) as? [GameEntity] {
            for result in fetchResults! {
                let gameName = game.value(forKey: "gameName") as? String
                let gameNameObject = gameObject.value(forKey: "gameName") as? String
                if gameName == gameNameObject{
                    self.managedContext.delete(result)
                }
            }
        }
        
        do {
            try self.managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func entityIsEmpty() -> Bool {
        let gameRquest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameEntity")
        if let gameResult =  try? self.managedContext.fetch(gameRquest) as? [GameEntity] {
            if gameResult?.count == 0 {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
}
