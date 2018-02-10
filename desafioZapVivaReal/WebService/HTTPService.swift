//
//  HTTPService.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper

class HttpService: NSObject{
    
    let clientID = "ybga0rqowjhwifsefqc3uaoic5tln1"
    
    func doGet(url:String, completion:@escaping (([Game]) -> Void)) {
        let headers: HTTPHeaders = [
            "Client-ID": clientID,
            "Accept": "application/vnd.twitchtv.v5+json",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            debugPrint(response.request!)
            
            let games = Mapper<Game>().mapArray(JSONArray: response.result.value as! [[String : Any]])

            completion(games)
        }
    }
}



