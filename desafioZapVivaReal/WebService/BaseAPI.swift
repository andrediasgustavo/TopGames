//
//  BaseAPI.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class BaseAPI: NSObject {
    
    let baseURL = "https://api.twitch.tv/kraken/games/top"
    
    func getURL(_ urlSufix: String) -> String {
        
        let url: String = self.baseURL + urlSufix
        return url
    }
    
    func getGamesWithPagination(_ limit: Int, pages: Int) -> String {
        return self.getURL("/?limit=\(limit)&offset=\(pages)")
    }

}
