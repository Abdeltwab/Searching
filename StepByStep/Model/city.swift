//
//  City.swift
//  JsonParsing
//
//  Created by Abdeltwab Elhussin on 10/27/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import Foundation

struct city {
    var cityName : String
    var lat : String
    var long : String
    
    init(city : String , lat:String , long: String) {
        self.cityName = city
        self.lat = lat
        self.long = long
    }
}
