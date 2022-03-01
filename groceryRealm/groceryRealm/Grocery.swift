//
//  Grocery.swift
//  groceryRealm
//
//  Created by Kenny Trang on 3/1/22.
//

import Foundation
import RealmSwift
import SwiftUI

class Grocery: Object{
    @Persisted(primaryKey: true) var _id = ObjectId.generate()
    @Persisted var name = ""
    @Persisted var bought = false
    
}
