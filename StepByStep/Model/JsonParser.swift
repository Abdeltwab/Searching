//
//  JsonParser.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/27/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//


//Stil not finsihed

import Foundation


class JSsonParser  {
    
    
    
    static func Paring () -> [Country]?{
        var Countries : [Country] = []
//        var Cities :[city] = []
        var Dic : [String :Any] =  [: ]
        
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                //  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options : .mappedIfSafe)  //get the file
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options : .mappedIfSafe)  else {
                    print("No data was returned by the request!")
                    return nil
                }
                // let arrayValue = try JSONDecoder().decode([City].self, from: data!)
                let parsedResult : [[String : String]]!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:String]]
                } catch {
                    print("Could not parse the data as JSON: '\(data)'")
                    return nil
                }
                
                //poplutes the arrays
                Dic =  Dictionary(grouping: parsedResult , by: { $0[JsonConstants.CountryName]! } )
                
                
                
                
                
                
                //fill the Array of Coutries
                for  item in Dic {
                    var tempCities : [city] = []
                    let coutry = item.key as! String
                    let recordsPerCoutry =  item.value as! [[String: String]]
                    for record in recordsPerCoutry {
                        let cityname  = record[JsonConstants.CityName]
                        let cityLt  = record[JsonConstants.CityLat]
                        let cityLng = record[JsonConstants.CityLong]
                        tempCities.append(city(city: cityname!, lat: cityLt!, long: cityLng!))
                    }
                    Countries.append(Country(CoutryName: coutry, cities: tempCities))
                    
                }
                
                
                
//                for C in Countries {
//                    for item in C.Dic {
//                        print ( item.key )
//                        for i in item.value {
//                            print(i.cityName)
//                            print(i.lat)
//                            print(i.long)
//                        }
//
//                    }
//                }
            
            }
      }
        return Countries

    }
    
    
}

