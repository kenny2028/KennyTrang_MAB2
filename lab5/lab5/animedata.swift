//
//  animedata.swift
//  lab5
//
//  Created by Kenny Trang on 2/28/22.
//

import Foundation

struct Anime: Decodable {
    let anime: String
    let character: String
    let quote: String
}


struct animeData : Decodable {
    
    var Animes = [Anime]()
}
