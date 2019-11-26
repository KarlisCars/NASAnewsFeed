//
//  Item.swift
//  NASAnewsFeed
//
//  Created by Karlis Cars on 23/11/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
import Gloss

struct Item: JSONDecodable {
    var title: String
    var content_html: String
    var url: String
    
    init?(json: JSON) {
        self.title = "title" <~~ json ?? ""
        self.content_html = "content" <~~ json ?? ""
        self.url = "url" <~~ json ?? ""
        
    }
}
