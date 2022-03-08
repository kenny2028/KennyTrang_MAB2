//
//  dataStore.swift
//  recipes
//
//  Created by Kenny Trang on 3/3/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Recipe: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var url: String
    
    
}
