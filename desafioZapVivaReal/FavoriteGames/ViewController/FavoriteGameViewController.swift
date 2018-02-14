//
//  FavoriteGameViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import CoreData

class FavoriteGameViewController: UIViewController  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var games = [Game]()
    var gamesDataBase = [NSManagedObject]()
    var coreDataManager = CoreDataManager()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.collectionView.isHidden = true
    
        NotificationCenter.default.addObserver(self, selector: #selector(self.addGame(_:)), name: NSNotification.Name(rawValue: "addGameNotification"), object: nil)
        
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.games.count == 0 {
            self.activityIndicator.stopAnimating()
            self.collectionView.isHidden = false
        }
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.gamesDataBase = self.coreDataManager.fetchDataBase()
}
    
    //MARK: Methods
    
    @objc func addGame(_ notification: NSNotification) {
        if let games = notification.userInfo as NSDictionary? {
            if let game = games["game"] as? Game{
                if self.games.count == 0 {
                    self.games.append(game)
                    self.coreDataManager.saveInDataBase(game: game)
                } else {
                    for i in self.games {
                        if i.gameName?.name == game.gameName?.name {
                           return
                        }
                    }
                    self.coreDataManager.saveInDataBase(game: game)
                    self.games.append(game)
                }
            }
        }
        self.collectionView.reloadData()
        self.activityIndicator.stopAnimating()
        self.collectionView.isHidden = false
    }
}


//MARK: DataSource
extension FavoriteGameViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gamesDataBase.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteGamesCell", for: indexPath) as! FavoriteGamesCollectionViewCell
        cell.setup(game: self.gamesDataBase[indexPath.row])
        return cell
        
    }
    
}

//MARK: Delegate
extension FavoriteGameViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 260)
        
    }
}

