//
//  animedataHandler.swift
//  lab6
//
//  Created by Kenny Trang on 3/28/22.
//

import Foundation

import RealmSwift

class animeDataHandler {
    var myRealm : Realm!
    var realmData : Results<anime>
        {
            get{
                return myRealm.objects(anime.self)
            }
        }
    func dbSetup() {
        do {
            myRealm = try Realm()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func addItem(newitem:anime) {
        do {
            try myRealm.write({
                myRealm.add(newitem)
            })
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getAnimes()->[anime] {
        return Array(realmData)
    }
    
    
    
}
