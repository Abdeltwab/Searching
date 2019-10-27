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
    
    //    let viewController =varevarntroller()
    
    override func setupConstraints() {
//        pageView.translatesAutoresizingMaskIntoConstraints = false
//
//      menuHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: options.menuHeight)
//      menuHeightConstraint?.isActive = true
//
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: topAnchor),
//
//            pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            pageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            pageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            pageView.topAnchor.constraint(equalTo: topAnchor)
//            ])
        
        pageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        menuHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: options.menuHeight)
        menuHeightConstraint?.isActive = true

        
        
//        NSLayoutConstraint(item: collectionView,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: , attribute: .top,
//                           multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint(item: collectionView,
//                           attribute: .leading,
//                           relatedBy: .equal, toItem: UINavigationBar.self,
//                           attribute: .leading,
//                           multiplier: 1.0,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: collectionView, attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: UINavigationBar.self,
//                           attribute: .trailing,
//                           multiplier: 1.0,
//                           constant: 0).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        
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
   // var  searchBarController: UISearchController?
    //var citySearchViewController: FixedTabelViewController?

    
   // fileprivate let filteredCities :[City]   //filterd cites
//    fileprivate let filteredCities :[City]   //filterd cites
//    var Cities :[[City]] = [
//        [
//        City(cityName: "hhh") ,
//        City(cityName: "shhh") ,
//        City(cityName: "dhhh") ,
//        City(cityName: "chhh") ,
//        City(cityName: "hhh") ,
//        ] ,
//        [
//            City(cityName: "Ehhh") ,
//            City(cityName: "Fshhh") ,
//            City(cityName: "Gdhhh") ,
//            City(cityName: "Echhh") ,
//            City(cityName: "Vhhh") ,
//            ],
//
//
//        ]
    
    var Cities :[City] = [
            City(cityName: "hhh") ,
            City(cityName: "shhh") ,
            City(cityName: "dhhh") ,
            City(cityName: "chhh") ,
            City(cityName: "hhh") ,
       ]
    
    

   // var filterdCities = [[City]]()
    var filterdCities = [City]()

    static var  seraching  = false
    
    
    
//    init() {
//        self.Cities = []
//
//    }
    
    
    
    
//    func confgireSearchController()  {
//        searchBarController?.searchBar.sizeToFit()
//        searchBarController?.searchBar.placeholder = "search here"
//        self.navigationController?.navigationBar.topItem?.titleView = searchBarController?.searchBar
//    }
    
    func confgireSearchController()  {
        searchBar.delegate = self

         searchBar.sizeToFit()
         searchBar.placeholder = "search here"
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
    
    
    
    
    private var Countries = [
        CountryItem(
            index: 0,
            title: "Egypt",
            cities: [City]()
        ),
        CountryItem(index: 1, title: "Alex", cities: [City]()),
        CountryItem(index: 2, title: "Egypt", cities: [City]()),
        CountryItem(index: 3, title: "Egypt", cities: [City]()),
       ]
    

    

    private let pagingViewController = CustomPagingViewController()
    private let menuInsets = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
    private let menuItemSize = CGSize(width: 120, height: 100)
    
//    private var menuHeight: CGFloat {
//        return menuItemSize.height + menuInsets.top + menuInsets.bottom
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // searchBarController = UISearchController(searchResultsController: pagingViewController)

        
        confgireSearchController()


//        navigationController?.navigationBar.isTranslucent = false
//          let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//
//        _ = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        titleLabel.text = "Home"
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        navigationItem.titleView = titleLabel
        
        
        
        
        
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
        // contrain it to all edges.
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
            Countries[index].cities = filterdCities

        }else {
           // Countries[index].cities = Cities[index]
            Countries[index].cities = Cities

        }
        viewController = FixedTabelViewController(cities: Countries[index].cities)

        return viewController
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        return Countries[index] as! T

    }
    
    func numberOfViewControllers<T>(in: PagingViewController<T>) -> Int{
        return  Countries.count
    }
    
}




extension ViewController :UISearchBarDelegate {
    
    //Change it to DidStart editing 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        
         filterdCities  = Cities.filter({$0.CityName!.lowercased().prefix(searchText.count) == searchText.lowercased()})

        //maybe a fix
       // filterdCities  = [Cities.filter({$0.CityName!.lowercased().prefix(searchText.count) == searchText.lowercased()})]

       // filterdCities  = Cities.filter({$0[0].CityName!.lowercased().prefix(searchText.count) == searchText.lowercased()})
//        filterdCities  = [
//            [
//                City(cityName: "h") ,
//
//                ] ,
//            [
//                City(cityName: "Ehhh") ,
//
//                ],
//            [
//                City(cityName: "3hhh") ,
//
//                ],
//            [
//                City(cityName: "$Ehhh") ,
//
//                ]
//
//        ]
        
        ViewController.seraching  = true
        pagingViewController.reloadData()
      //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "relaodTableView"), object: nil)

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
