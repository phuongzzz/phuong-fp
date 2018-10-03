//
//  Restaurant.swift
//  FoodPin
//
//  Created by phuongzzz on 10/1/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var rating = ""
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
