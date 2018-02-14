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
    
    static let shared = APIRequest()
    
    let baseAPI = BaseAPI()
    
    // MARK: - Methods Services
    func getGames(limit:Int, pages: Int, completion: (([Game]) -> Void)!) {
        
        self.doGet(url: (baseAPI.getGamesWithPagination(limit, pages: pages))) { (data) in
            completion(data)
        }
    }
}


