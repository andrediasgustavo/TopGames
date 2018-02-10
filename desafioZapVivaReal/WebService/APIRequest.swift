//
//  APIRequest.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//


import UIKit
import ObjectMapper

class APIRquest: HttpService {
    
    let baseAPI = BaseAPI()
    var game: Game?
    
    // MARK: - Methods Services
    func getGames(page:Int, completion: (([Game]) -> Void)!) {
        
        self.doGet(url: (baseAPI.getGamesWithPagination(page))) { (data) in
            var games = [Game]()
            games = data
            completion(games)
        }
    }
}


