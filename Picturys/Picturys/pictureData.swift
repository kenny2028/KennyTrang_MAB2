//
//  pictureData.swift
//  Picturys
//
//  Created by Kenny Trang on 2/14/22.
//

import Foundation
import UIKit
import RealmSwift


class pictureData: Object {
    
    //var picture = UIImage()
    @Persisted(primaryKey: true) var _id = ObjectId.generate()
    
    @Persisted var picturedata : Data?
    
    @Persisted var imagetags : String?
    @Persisted var favorited = false
    @Persisted var date : String?
    //@Persisted var month : String?
    @Persisted var datetag: Date?
}
