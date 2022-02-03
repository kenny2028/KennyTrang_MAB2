//
//  dataLoader.swift
//  Continents
//
//  Created by Kenny Trang on 2/1/22.
//

import Foundation

class dataLoader {
    
    var allData = [continentsData]()
    
    func loadData(fileName: String) {
        
        
        
        
        
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([continentsData].self, from: data)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
        
        
    
    }
    
    
    func getContinents() -> [String] {
        var Continents = [String]()
        
        for item in allData{
            Continents.append(item.continent)
        }
        
        return Continents
        
    }
    
    func getCountries(index:Int) -> [String] {
        
        return allData[index].countries
    }
    
    func addCountry(index:Int, newCountry:String, newIndex:Int) {
        allData[index].countries.insert(newCountry, at: newIndex)
        
    }
    
    func deleteCountry (index:Int, countryIndex: Int) {
        allData[index].countries.remove(at: countryIndex)
    }
    
    
    
}
