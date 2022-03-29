//
//  animelist.swift
//  lab6
//
//  Created by Kenny Trang on 3/28/22.
//

import Foundation
import RealmSwift

class anime: Object {
    @Persisted(primaryKey: true) var _id = ObjectId.generate()
    @Persisted var name = ""
}
