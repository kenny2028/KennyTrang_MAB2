//
//  dataLoader.swift
//  lab3
//
//  Created by Kenny Trang on 2/8/22.
//

import Foundation


class dataLoader {
    
    var dataHolder = [AnimalsData]()
    
    //Load File & Data
    
    func loadData (filename: String) {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            let plistdecoder = PropertyListDecoder()
            
            do {
                let data = try Data(contentsOf: pathURL)
                dataHolder = try plistdecoder.decode([AnimalsData].self, from: data)
                
            } catch {
                //handle error
                print(error)
            }
        }
        
    }
    
    
    
    
    //MARK: Helper Functions
    
    func getAnimalTypes() -> [String] {
        var returnAnimals = [String]()
        for allitems in dataHolder {
            returnAnimals.append(allitems.animalType)
        }
        
        //returns a string array of animal names only
        return returnAnimals

    }
    
    
    func getAnimals(index: Int) -> [String] {
        
        //returns a string array of animals under animalType with Index #
        return dataHolder[index].animals
        
    }
    
    
    func addAnimal(index:Int, newIndex: Int, newAnimal: String) {
        dataHolder[index].animals.insert(newAnimal, at: newIndex)
        
    }
    
    func deleteAnimal(index:Int, animalPosition: Int) {
        dataHolder[index].animals.remove(at: animalPosition)
    }
    
    
    
    
    
}
