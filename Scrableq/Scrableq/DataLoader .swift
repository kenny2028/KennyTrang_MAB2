//
//  DataLoader .swift
//  Scrableq
//
//  Created by Kenny Trang on 1/27/22.
//

import Foundation

class DataLoader{
    
    var qNoUWords = [String]()
    func loadData(fileName: String) {
        
        
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                qNoUWords = try plistdecoder.decode([String].self, from: data)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    
    }
    func getWords()->[String]{
        return qNoUWords
    }

    
}


