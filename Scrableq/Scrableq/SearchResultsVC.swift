//
//  SearchResultsVC.swift
//  Scrableq
//
//  Created by Kenny Trang on 1/27/22.
//

import UIKit

//Sub class UITableviewcontroller cocotouch class
//Stub methods are provided as result

class SearchResultsVC: UITableViewController, UISearchResultsUpdating {
    
    
    var allwords = [String]()
    
    var filterwords = [String]()
    
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
//        just remove just incase you already did one search before
        filterwords.removeAll(keepingCapacity: true)
        if searchString?.isEmpty == false {
            let searchfilter: (String) -> Bool = {name in
                let range = name.range(of: searchString!, options: .caseInsensitive)
                return range != nil
//                returns true if the value matches and false if theres no match
                
            }
            
            let matches = allwords.filter(searchfilter)
            filterwords.append(contentsOf: matches)
        }
        tableView.reloadData()
//        pretty expensive call be careful (recalls delagates and methods)
//        you can call reload data to reload the table view 
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Have to load cell with indentifier becuase there is no storyboard connection
//        you always access your tableview from a class that subclasses from UITableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ScrabbleCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        number of sections return
        
        
        
        
        // #warning Incomplete implementation, return the number of sections
//        return 0
        return 1
//        take out return 0
    }

    
//    Only one list of search results
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterwords.count
    }

    
    
//    Draws and creates the cell, always needed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrabbleCell", for: indexPath)

        var cellconfig = cell.defaultContentConfiguration()
        cellconfig.text = filterwords[indexPath.row]
        
        cell.contentConfiguration = cellconfig
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
