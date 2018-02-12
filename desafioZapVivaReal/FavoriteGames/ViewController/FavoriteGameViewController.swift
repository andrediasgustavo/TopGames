//
//  FavoriteGameViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class FavoriteGameViewController: UIViewController  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl?
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
        
//        APIRequest.shared.getGames(page: 1, completion: { (gamesResult) in
//
//            if !gamesResult.isEmpty {
//                for game in gamesResult {
//
//                    self.games?.append(game)
//                    self.collectionView.reloadData()
//                }
//                self.activityIndicator.stopAnimating()
//                self.collectionView.isHidden = false
//                self.refreshControl?.endRefreshing()
//            } else {
//                self.activityIndicator.stopAnimating()
//                self.collectionView.isHidden = false
//                self.refreshControl?.endRefreshing()
//            }
//        })
    }
}

//MARK: DataSource
extension FavoriteGameViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCell", for: indexPath) as! TopGamesCollectionViewCell
        cell.setup(game: self.games![indexPath.row])
        return cell
        
    }
    
}

//MARK: Delegate
extension FavoriteGameViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 220)
        
    }
}

