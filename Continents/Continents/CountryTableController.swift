//
//  CountryTableController.swift
//  Continents
//
//  Created by Kenny Trang on 2/3/22.
//

import UIKit

class CountryTableController: UITableViewController {

    var selectedContinent = 0
    var getData = dataLoader()
    var countryList = [String]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        countryList = getData.getCountries(index: selectedContinent)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = countryList[indexPath.row]
        cell.contentConfiguration = cellConfig
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            countryList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            getData.deleteCountry(index: selectedContinent, countryIndex: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromRow = fromIndexPath.row // row being moved from
        let toRow = to.row
        let moveCountry = countryList[fromRow]
        countryList.swapAt(fromRow, toRow)
        
        //move in data model instance
        getData.deleteCountry(index: selectedContinent, countryIndex: fromRow)
        getData.addCountry(index: selectedContinent, newCountry: moveCountry, newIndex: toRow)

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="donesegue"{
            if let source = segue.source as? AddViewController {
                //only add a country if there is text in the textfield
                if source.addedCountry.isEmpty == false{
                    //add country to our data model instance
                    getData.addCountry(index: selectedContinent, newCountry: source.addedCountry, newIndex: countryList.count)
                    //add country to the array
                    countryList.append(source.addedCountry)
                    tableView.reloadData()
                }
             }
        }
    }
    
}
