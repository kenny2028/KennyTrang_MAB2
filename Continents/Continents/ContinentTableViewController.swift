//
//  ContinentTableViewController.swift
//  Continents
//
//  Created by Kenny Trang on 2/1/22.
//

import UIKit

class ContinentTableViewController: UITableViewController {
    
    var continent = [String]()
    var continentsData = dataLoader()
    let dataFile = "continents2"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continentsData.loadData(fileName: dataFile)
        continent = continentsData.getContinents()
        
        
    
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
//    Changes needs to DRAW CHECKMARK 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return continent.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContinentCell", for: indexPath)

        // Configure the cell...
        var configure =  cell.defaultContentConfiguration()
        configure.text = continent[indexPath.row]
        cell.contentConfiguration = configure
    
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrysegue" {
            if let countryVC = segue.destination as? CountryTableController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    countryVC.title = continent[indexPath.row]
                    countryVC.getData = continentsData
                    countryVC.selectedContinent = indexPath.row
                }
            }
        } else {
            if let infoVC = segue.destination as? InfoTableViewController {
                if let editingCell = sender as? UITableViewCell{
                    let indexPath = tableView.indexPath(for: editingCell)
                    infoVC.name = continent[indexPath!.row]
                    let countryList = continentsData.getCountries(index: (indexPath?.row)!)
                    infoVC.number = String(countryList.count)
                }
            }
        }
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
