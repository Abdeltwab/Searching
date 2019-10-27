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
    let index: Int
    let title: String
    //let headerImage: UIImage
    var cities: [City]
    
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

