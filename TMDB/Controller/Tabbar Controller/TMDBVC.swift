//
//  TMDBVC.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import UIKit

class TMDBVC: UITabBarController {
    
    //Get user.name from the module after signing in/up
    let user = ("Noor",19)
    
    override func viewDidLoad() {
        navigationItem.title = "Welcome, \(user.0) !"
    }
}
