//
//  Country.swift
//  JsonParsing
//
//  Created by Abdeltwab Elhussin on 10/27/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import Foundation

struct  Country {
    var Countyname :String
    var Cities : [city]
    var Dic : [String : [city]]
    init(CoutryName :String , cities : [city]) {
        self.Cities = cities
        self.Countyname = CoutryName
        self.Dic = [self.Countyname : self.Cities]
    }
}
