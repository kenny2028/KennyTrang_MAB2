//
//  animeDataLoader.swift
//  lab5
//
//  Created by Kenny Trang on 2/28/22.
//

import Foundation


class AnimeDataHandler {
    
    var animedata = [Anime]()
    
    func loadjson() async {
        
        guard let urlPath = URL(string:"https://animechan.vercel.app/api/random")
            else {
                print("url Error")
                return
            }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlPath, delegate: nil)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                print("file downlaod error")
                return
            }
            print("download complete")
            parsejson(data)
        } catch {
            print(error.localizedDescription)
            
            
        }
        
        
        
        
    }
    
    func parsejson(_ data: Data) {
        do
        {
            print("parsing")
            let apiData = try JSONDecoder().decode(Anime.self, from: data)
            animedata.append(Anime(anime: apiData.anime, character: apiData.character,quote: apiData.quote))
            
            
            

            print ("parsejson done")
        }
        catch let jsonErr
        {
            print(jsonErr.localizedDescription)
            return
        }
    }
    
    func getAnimeQuotes() -> [Anime] {
        return animedata
    }
    
    
    
    
    
}
