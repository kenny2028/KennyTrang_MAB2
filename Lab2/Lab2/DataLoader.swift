//
//  DataLoader.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import Foundation


class DataLoader {
    
    var allData = [movieData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([movieData].self, from: data)
            } catch {
                //handle error
                print(error)
            }
        }
    }
    
    func getMovieGenres() -> [String]{
        var moviegenres = [String]()
        for movie in allData {
            moviegenres.append(movie.moviegenre)
            print(movie.moviegenre)
        }
        return moviegenres
    }
    
    func getMovies(index: Int) -> [String] {
        return allData[index].movies
    }
    
}
