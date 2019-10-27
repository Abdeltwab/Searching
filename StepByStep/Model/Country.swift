//
//  Country.swift
//  JsonParsing
//
//  Created by Abdeltwab Elhussin on 10/27/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import Foundation

struct  Country {
    let Countyname :String
    let Cities : [City]
    let Dic : [String : [City]]
    init(CoutryName :String , cities : [City]) {
        self.Cities = cities
        self.Countyname = CoutryName
        self.Dic = [self.Countyname : self.Cities]
    }
}
