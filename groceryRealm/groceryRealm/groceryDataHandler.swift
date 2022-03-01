//
//  groceryDataHandler.swift
//  groceryRealm
//
//  Created by Kenny Trang on 3/1/22.
//

import Foundation
import RealmSwift

class GroceryDataHandler {
    
    var myRealm : Realm! //Realm Database instance
    var groceryData: Results <Grocery> // collection of objects - reuslts replace array
    {
        get {
            return myRealm.objects(Grocery.self) //return all Grocery objects from realm
        }
    }
    
    func dbSetup() {
        do {
            //initializes realm database
            myRealm = try Realm() //when using try, must use do catch statement // this is what creates the realm database - can also pass to name the realm
        } catch let error {
            print(error.localizedDescription)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!) // tells you location of realm database
    }
    
    func addItem(newItem: Grocery) {
        do {
            try myRealm.write ({
                myRealm.add(newItem)
            })
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteItem(item: Grocery) {
        do {
            try myRealm.write ({
                myRealm.delete(item)
            })
        }catch let error {
            
            print(error.localizedDescription)
        }
        
    }
    
    func boughtItem(item: Grocery) {
        
        do {
            try myRealm.write ({
                item.bought = !item.bought
            })
        }catch let error {
            print (error.localizedDescription)
        }
        
    }
    
    
    func getGroceries() -> [Grocery] {
        return Array(groceryData) //converts result to Array 
    }
    
    
    
}

