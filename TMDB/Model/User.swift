//
//  User.swift
//  TMDB
//
//  Created by Noor Walid on 22/02/2021.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    
}
