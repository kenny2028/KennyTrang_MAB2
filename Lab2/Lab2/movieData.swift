//
//  movieData.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import Foundation


struct movieData: Decodable {
    let moviegenre : String
    let movies: [String]
}
