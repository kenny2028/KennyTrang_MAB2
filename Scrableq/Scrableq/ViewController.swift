//
//  ViewController.swift
//  Scrableq
//
//  Created by Kenny Trang on 1/27/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var words = [String]()
    var data = DataLoader()
    let wordFile = "qwordswithoutu1"
    
    var searchController = UISearchController() // Makeing a search ocntroller

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data.loadData(fileName: wordFile)
        words = data.getWords()
        
        
        // Search controller
//        make search controller
        let resultController =  SearchResultsVC()
        resultController.allwords = words // set the allwords property to our words array
        
        searchController = UISearchController(searchResultsController: resultController) // Create search controller and add result controller parameter
        
        //configure search bar
        searchController.searchBar.placeholder = "Enter a search term"
        searchController.searchBar.sizeToFit()//Makes the searchbar the width of table
        
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = resultController // Set to Controller of result
        
        
        
    }
    
//    return number of items in list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    
//    everytime a cell is called - make a cell - create a cell config - set attribues - set cell config - return cell
//    DATA SOURCE PROTOCOLS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrabbleCell", for: indexPath)
//        indexpath is of type indexpath and indicates the location of the cell, indexpath.row will give you the row and will also give you the section. It's passed into the protocol alot
//
        var cellConfig = cell.defaultContentConfiguration()
//        you can set image, secondary text here
        cellConfig.text = words[indexPath.row]
        cellConfig.image = UIImage(named: "p")
        cellConfig.secondaryText = "Q no U"
        
        
        cell.contentConfiguration = cellConfig
        return cell
    }
    
    
//    DELEGATE PROTOCOL for selection so for screen transfers etc.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Row Selected", message: "You selected \(words[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    


}

