//
//  topGamesViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import CoreData

class TopGamesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl?
    var apiRequest: APIRequest?
    var games: [Game]?

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshGames), for: .valueChanged)
       
        self.collectionView.addSubview(refreshControl!)
        self.activityIndicator.startAnimating()
        self.collectionView.isHidden = true
        self.games = [Game]()
        self.getGames()
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        view.layoutIfNeeded()
    }
    
    //MARK: Methods
    
    @objc func refreshGames() {
        self.getGames()
    }
    
    func getGames() {
        
        APIRequest.shared.getGames(page: 1, completion: { (gamesResult) in
          
            if !gamesResult.isEmpty {
                for game in gamesResult {
                   
                    self.games?.append(game)
                    self.collectionView.reloadData()
                }
                self.activityIndicator.stopAnimating()
                self.collectionView.isHidden = false
                self.refreshControl?.endRefreshing()
            } else {
                self.activityIndicator.stopAnimating()
                self.collectionView.isHidden = false
                self.refreshControl?.endRefreshing()
            }
        })
    }
    
    //MARK: Core Data
    
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "desafioZapVivaReal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}


//MARK: SearchBar

extension TopGamesViewController: UISearchBarDelegate {
    
}

//MARK: DataSource
extension TopGamesViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCell", for: indexPath) as! TopGamesCollectionViewCell
        cell.setup(game: self.games![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameDetail = storyboard.instantiateViewController(withIdentifier: "GameDetailViewController") as!
        GameDetailViewController
        gameDetail.setupVC(game: self.games![indexPath.row])
//        self.performSegue(withIdentifier: "DetailViewControllerSegue", sender: self)
        self.navigationController?.show(gameDetail, sender: self)
    }
}

//MARK: Delegate
extension TopGamesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 220)
    }
}


