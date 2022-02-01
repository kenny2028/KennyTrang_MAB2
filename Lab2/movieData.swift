//
//  movieData.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import Foundation


struct allmovieData: Decodable {
    let genre:String
    let movies: [String]
}
