//
//  dataHandler.swift
//  Picturys
//
//  Created by Kenny Trang on 3/15/22.
//

import Foundation
import RealmSwift



class pictureDataHandler {
    
    var myRealm: Realm!
    var ALLpictureData: Results<pictureData>
    {
        get {
            return myRealm.objects(pictureData.self)
        }
    }
    
    //Initialize The realm Database
    func realmSetup() {
        do {
            myRealm = try Realm()
        }catch {
            print(error.localizedDescription)
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
    }
    
    
    func addItem(newItem: pictureData) {
        
        do {
            try myRealm.write({myRealm.add(newItem)})
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    func deleteItem(Item: pictureData) {
        
        do {
            try myRealm.write({myRealm.delete(Item)})
        } catch let error {
            print(error.localizedDescription)
        }
    
    }
    
    
    func getAllImages() -> [pictureData] {
        return Array(ALLpictureData)
    }
    
    

    
    
}
