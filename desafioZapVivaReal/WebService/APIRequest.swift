//
//  APIRequest.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//


import UIKit
import ObjectMapper

class APIRequest: HttpService {
    
    let baseAPI = BaseAPI()
    
    // MARK: - Methods Services
    func getGames(page:Int, completion: (([Game]) -> Void)!) {
        
        self.doGet(url: (baseAPI.getGamesWithPagination(page))) { (data) in
            
            completion(data)
        }
    }
}


