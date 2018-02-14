//
//  topGamesViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import CoreData

class TopGamesViewController: UIViewController, FavoriteGame {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl?
    var apiRequest: APIRequest?
    var games: [Game]?
    var filteredGames: [Game]?
    var useFilteredArray = false
    var indexPathRow: Int?
    var favoriteGamesViewController: FavoriteGameViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshGames), for: .valueChanged)
        self.searchBar.showsCancelButton = false
        self.searchBar.delegate = self
        self.collectionView.addSubview(refreshControl!)
        self.activityIndicator.startAnimating()
        self.collectionView.isHidden = true
        self.games = [Game]()
        self.getGames()
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
//        view.layoutIfNeeded()
    }
    
    //MARK: Methods        
    
    func favoriteGame(cell: TopGamesCollectionViewCell) {
        let indexPath = self.collectionView.indexPath(for: cell)
        self.indexPathRow = indexPath?.row
        self.collectionView.reloadData()
    }
    
    
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
    
   
    
   
}


//MARK: SearchBar
extension TopGamesViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredGames = [Game]()
        self.filteredGames = self.games?.filter({ (games) -> Bool in
            return games.gameName?.name?.lowercased().range(of: searchText.lowercased()) != nil
        })
        
        if searchText == "" || searchText.count < 1 {
            self.useFilteredArray = false
             self.searchBar.showsCancelButton = false
            self.searchBar.resignFirstResponder()
            self.collectionView.reloadData()
        } else {
            self.useFilteredArray = true
            self.searchBar.showsCancelButton = true
            self.collectionView.reloadData()
            
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        self.useFilteredArray = false
        self.collectionView.reloadData()
    }

}

//MARK: DataSource
extension TopGamesViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let games = self.useFilteredArray ? self.filteredGames : self.games
        return games!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellGames = self.useFilteredArray ? self.filteredGames : self.games
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCell", for: indexPath) as! TopGamesCollectionViewCell
        cell.delegate = self
        cell.setup(game: cellGames![indexPath.row])
        
        if self.indexPathRow != nil && indexPath.row == self.indexPathRow! {
            cell.favoriteButton.setImage(UIImage(named: "favoriteGame"),  for: .normal)
            cellGames![indexPath.row].isFavorite = true
            let gameHash:[String: Game] = ["game": cellGames![indexPath.row]]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addGameNotification"), object: nil, userInfo: gameHash)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameDetail = storyboard.instantiateViewController(withIdentifier: "GameDetailViewController") as!
        GameDetailViewController
        let cellGames = self.useFilteredArray ? self.filteredGames : self.games
        gameDetail.setupVC(game: cellGames![indexPath.row])
        self.navigationController?.show(gameDetail, sender: self)
    }
}

//MARK: Delegate
extension TopGamesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 250)
    }
}


