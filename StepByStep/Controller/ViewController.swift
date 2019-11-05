//
//  ViewController.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/25/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import UIKit
import Parchment


class CustomPagingView: PagingView {
    
    var menuHeightConstraint: NSLayoutConstraint?
    
    
    override func setupConstraints() {
       pageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        menuHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: options.menuHeight)
        menuHeightConstraint?.isActive = true

        NSLayoutConstraint.activate([
            
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
           collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
           collectionView.topAnchor.constraint(equalTo: topAnchor , constant : -20),
            
            pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageView.topAnchor.constraint(equalTo: topAnchor , constant : 82)
            ])
    }
}

class CustomPagingViewController: PagingViewController<CountryItem> {
    
    override func loadView() {
        view = CustomPagingView(
            options: options,
            collectionView: collectionView,
            pageView: pageViewController.view
        )
    }
}


class ViewController: UIViewController  {

  let searchBar = UISearchBar()


    var CountriesList  : [Country] = []
    var CountriesItems : [CountryItem] = []
     var filterdCities = [city]()
    var currentCoutryIndex = 0     // dummy solution for the filterating feature

   // var filterdCities = [[City]]()

    
    //fill data ssource
    private func fillDataSource (CountriesList : [Country]) -> [CountryItem]{
        var countryName :String = " "
        var cities : [city] = []
        var CountryITems : [CountryItem] = []
        var  i: Int = 0
        for C in CountriesList {
            for item in C.Dic {
                countryName = item.key   // print ( item.key )
                for i in item.value {
                    cities.append(city(city: i.cityName, lat: i.lat, long: i.long))
                }
                CountryITems.append(CountryItem(indx: i, countyName: countryName, citiesList: cities))
                cities.removeAll()
                i = i + 1
            }
            
        }
        
        return CountryITems
        
    }
    
    
    
    static var  seraching  = false

    
    func confgireSearchController()  {
         searchBar.delegate = self
         searchBar.sizeToFit()
         searchBar.placeholder = "search here"
         self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
    private let pagingViewController = CustomPagingViewController()
    private let menuInsets = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
    private let menuItemSize = CGSize(width: 120, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //data source
         CountriesList = JSsonParser.Paring()!   // the data source
         CountriesItems =  fillDataSource (CountriesList: CountriesList)
        
       
        
        
         confgireSearchController()
    
        
        pagingViewController.menuItemSource = .class(type: CountryPagingCell.self)
        pagingViewController.menuItemSize = .fixed(width: menuItemSize.width, height: menuItemSize.height)
        pagingViewController.menuItemSpacing = 8
        pagingViewController.menuInsets = menuInsets
        pagingViewController.borderColor = UIColor(white: 0, alpha: 0.1)
        pagingViewController.indicatorColor = .black
        
        pagingViewController.indicatorOptions = .visible(
            height: 1,
            zIndex: Int.max,
            spacing: UIEdgeInsets.zero,
            insets: UIEdgeInsets.zero
        )
        
        pagingViewController.borderOptions = .visible(
            height: 1,
            zIndex: Int.max - 1,
            insets: UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        )
        
        // Add the paging view controller as a child view controller and
        // constraint  it to all edges.
        addChild(pagingViewController)
       view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        
       //  Set our data source and delegate.
        pagingViewController.dataSource = self
      //  pagingViewController.delegate = self
        
       
    }


}


extension ViewController: PagingViewControllerDataSource {
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController {
        let viewController : UIViewController
        if (ViewController.seraching) {
          //  Countries[index].cities = filterdCities[index]
            CountriesItems[index].cities = filterdCities
            viewController = FixedTabelViewController(cities: CountriesItems[index].cities)

        }else {
            viewController = FixedTabelViewController(cities: CountriesItems[index].cities)

        }
        currentCoutryIndex = index
        return viewController
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        return    CountriesItems[index] as! T

    }
    
    func numberOfViewControllers<T>(in: PagingViewController<T>) -> Int{
        return    ( ( CountriesItems.count) / 20  )
    }
    
}




extension ViewController :UISearchBarDelegate {
    
    //Change it to DidStart editing 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        
       // if searchText.isEmpty {
       print(currentCoutryIndex)
       filterdCities = CountriesItems[currentCoutryIndex].cities.filter({$0.cityName.lowercased().prefix(searchText.count) == searchText.lowercased()})

    
        
        
        ViewController.seraching  = true
        pagingViewController.reloadData()
    
        // myTableView.reloadData()

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        ViewController.seraching  = false
        searchBar.text = ""
        pagingViewController.reloadData()


       // myTableView.reloadData()
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        pagingViewController.reloadData()
    }
    
    
    
}
