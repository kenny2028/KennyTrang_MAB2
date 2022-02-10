//
//  DataLoader.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import Foundation


class dataLoader {
    var allData = [allmovieData]()
    
    func loadData(filename: String)  {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                
                allData = try plistdecoder.decode([allmovieData].self, from: data)
            } catch {
                print ("err")
            }
        }
    }
    
    
    func getGenres() -> [String] {
        var movies = [String]()
        for movie in allData {
            movies.append(movie.genre)
        }
        return movies
        
    }
    
    func getMovies(index: Int) -> [String] {
        return allData[index].movies
    }
    
    
}
