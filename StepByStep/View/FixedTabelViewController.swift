//
//  FixedTabelViewController.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/26/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import UIKit

class FixedTabelViewController: UIViewController {

    let cellID: String = "CityCellIdentifier"
    

    var filterdCities = [city]()
    var Cities = [city]()


    var searching  = false
    

    
    lazy var tableVew: UITableView = {
        let tableVew = UITableView(frame: .zero)
        return tableVew
    }()
    


    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "relaodTableView"), object: nil)

    }
    @objc func refresh() {
        
        self.tableVew.reloadData() // a refresh the tableView.
        
    }
    
    init(cities: [city]) {
        if (self.searching) {
            self.filterdCities = cities
        }else {
            self.Cities = cities

        }
        super.init(nibName: nil, bundle: nil)
        view.addSubview(tableVew)
        view.constrainToEdges(tableVew)
        tableVew.dataSource = self
        tableVew.delegate = self
        tableVew.register(CityTableViewCell.self, forCellReuseIdentifier: cellID)


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FixedTabelViewController : UITableViewDataSource  , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return Cities.count

//        if searching {
//            return Cities.count
//        } else {
//            return FilterdCities!.count
//        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CityTableViewCell
        cell.NameLabel.text =  Cities[indexPath.row].cityName
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CityTableViewCell
//        if searching {
//            cell?.textLabel?.text = Cities[indexPath.row].CityName
//        } else {
//            cell?.textLabel?.text = FilterdCities![indexPath.row].CityName
//        }
//
//        //cell.textLabel!.text = "\(countryNameArr[indexPath.row])"
//        return cell!

    }
    
    
}


    

