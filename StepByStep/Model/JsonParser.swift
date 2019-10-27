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
    
    var Countries : [Country] = []
    var Cities :[City] = []
    var Dic : [String :Any] =  [: ]
    
    static func Parsing () {
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                //  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options : .mappedIfSafe)  //get the file
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options : .mappedIfSafe)  else {
                    print("No data was returned by the request!")
                    return
                }
                // let arrayValue = try JSONDecoder().decode([City].self, from: data!)
                let parsedResult : [[String : String]]!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:String]]
                } catch {
                    print("Could not parse the data as JSON: '\(data)'")
                    return
                }
                
                /// var CoutriesArray : [String] = []
                //poplutes the arrays
                for i in 0...parsedResult.count  {
                    if (i <= 10 ) {
                        
                        // CoutriesArray.append(parsedResult?[i][JsonConstants.CountryName] as! String)
                        //                        Countries.append(Country(CoutryName: parsedResult[i][JsonConstants.CountryName]!, cities: Cities))
                        //
                        //                        Cities.append(City(
                        //                            city: parsedResult[i][JsonConstants.CityName]!,
                        //                            lat: parsedResult[i][JsonConstants.CityLat]!,
                        //                            long: parsedResult[i][JsonConstants.CityLong]!)
                        //                         )
                        
                        //                      Coutries.append(Country(CoutryName: parsedResult[i][JsonConstants.CountryName]!, cities: Cities))
                        // Countries.app
     // **the key data structure**    Dic =  Dictionary(grouping: parsedResult , by: { $0[JsonConstants.CountryName]! } )
                        //Countries.append(Country(CoutryName: Dic.index(forKey: JsonConstants.CountryName), cities: <#T##[City]#>))
                        
                    }else {
                        break
                    }
                }
                
                
                
                //**Most closest  try***/
                
//                for  item in Dic {
//
//                    let coutry = item.key as! String
//                    let x =  item.value as! [[String: String]]
//                    print(coutry,  x ,  x.count)
//
//                }
                
                
                //
                
                //                let groupdeDic = Dictionary(grouping: Coutries) { _ in {country  } -> [City]
                //                    return co
                //                }
                
                //                let groupByCoutry  = Dictionary(grouping: Coutries) { (C) -> [City] in
                //                    return
                //                }
                
                //                for key in Coutries {
                //                    print( key.Countyname )
                //                }
                //print(Coutries)
                
                //  print(CoutriesArray)
                
                //                let countriesArray = parsedResult?[][JsonConstants.CountryName] as! [AnyObject]
                //                print(parsedResult.count)
                //                let result = parsedResult.count
                //
                //                for (i = 0 , )
                //
                // let Coutries = parsedResult![10][JsonConstants.CountryName]
                //   print(Coutries)
                
                
                
                
                // print (parsedResult[0][JsonConstants.CountryName] )
                
            }catch {
                print("error")
            }
            
        }
    }
    
}

