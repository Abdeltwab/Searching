import UIKit

class TableViewController: UITableViewController , UISearchResultsUpdating, UISearchBarDelegate{
    
     let cellID: String = "CityCellIdentifier"
    fileprivate let Cities: [City]?


    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    
    init(cities: [City]) {
        self.Cities = cities
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(collectionView)
        view.constrainToEdges(collectionView)
        
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(
//            ImageCollectionViewCell.self,
//            forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
//
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CityTableViewCell
        //cell.NameLabel.text = "test"
        
        return cell
    }
    
}
