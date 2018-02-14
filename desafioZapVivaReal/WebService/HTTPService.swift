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
            "Accept": "application/vnd.twitchtv.v5+json"
        ]
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success:
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                debugPrint(response.request!)
                
                let result = (response.result.value as! [String : AnyObject])["top"] as! [[String : AnyObject]]
                
                let games = Mapper<Game>().mapArray(JSONArray: result)
                
                completion(games)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                
            }
            
            
        }
    }
}



