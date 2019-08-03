//
//  GiphyPost.swift
//  InterlaceCodingTest
//
//  Created by Afnan Mirza on 8/2/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GiphyPost {
    var trending_datetime: String?
    var url: String?
    var image: String?
    
    init(json: JSON) {
        if let dateTime = json["trending_datetime"].string {
            self.trending_datetime = dateTime
        }
        
        if let url = json["url"].string {
            self.url = url
        }
        
        if let image = json["images"]["downsized_large"]["url"].string {
            self.image = image
        }
    }
}
