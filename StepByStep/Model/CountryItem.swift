//
//  CountryItem.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/26/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import UIKit
import Parchment

struct CountryItem: PagingItem, Hashable, Comparable {
    var index: Int
    var title: String
    //let headerImage: UIImage
   // var cities: [City]
    var cities : [city]
    
    
    init(indx: Int , countyName :String , citiesList : [city]) {
        self.cities = citiesList
        self.title = countyName
        self.index = indx
    }
    var hashValue: Int {
        return index.hashValue &+ title.hashValue
    }
    
    static func ==(lhs: CountryItem, rhs: CountryItem) -> Bool {
        return lhs.index == rhs.index && lhs.title == rhs.title
    }
    
    static func <(lhs: CountryItem, rhs: CountryItem) -> Bool {
        return lhs.index < rhs.index
    }
}

