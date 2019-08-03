//
//  GiphyAPI.swift
//  InterlaceCodingTest
//
//  Created by Afnan Mirza on 8/2/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias fetchedGiphyPostCompletionHandler = ([GiphyPost]) -> Void

class GiphyAPI {
    static let hostUrl = "https://api.giphy.com/v1"
    static let apiKey = "kxAtTTi7NcfqJh8nLXymdsFEvX6al3fE"
    
    static func searchGiphyAPI(searchQuery: String, completion: @escaping fetchedGiphyPostCompletionHandler) {
        guard let url = URL(string: "\(hostUrl)/gifs/search?api_key=\(apiKey)&q=\(searchQuery)&lang=en") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            let json = JSON(dataResponse)
            
            if let data = json["data"].array {
                var giphyPostArr: [GiphyPost] = [GiphyPost]()
                
                data.forEach({ (item) in
                    let post = GiphyPost(json: item)
                    giphyPostArr.append(post)
                })
                
                completion(giphyPostArr)
                return
            }
        }
        task.resume()
    }
    
    static func fetchTrendingGiphy(completion: @escaping fetchedGiphyPostCompletionHandler) {
        guard let url = URL(string: "\(hostUrl)/gifs/trending?api_key=\(apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            let json = JSON(dataResponse)
            
            if let data = json["data"].array {
                var giphyPostArr: [GiphyPost] = [GiphyPost]()
                
                data.forEach({ (item) in
                    giphyPostArr.append(GiphyPost(json: item))
                })
                
                completion(giphyPostArr)
                return
            }
        }
        
        task.resume()
    }
    
}
