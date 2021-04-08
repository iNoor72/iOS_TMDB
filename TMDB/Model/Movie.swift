//
//  Movie.swift
//  TMDB
//
//  Created by Noor Walid on 12/02/2021.
//

import Foundation
import RealmSwift

class Movie: Object, Codable {
    //var results: [MovieData] = [MovieData]()
    @objc dynamic var title = ""
    @objc dynamic var date = ""
    @objc dynamic var isFavorite = false
    @objc dynamic var overview = ""
}
//
//class MovieData: Object, Codable {
//    @objc dynamic var title = ""
//    @objc dynamic var date = ""
//    @objc dynamic var isFavorite = false
//    @objc dynamic var overview = ""
//}
