//
//  FavoritesVC.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import UIKit
import RealmSwift

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteMoviesArray : Results<Movie>? = nil
    let realm = try! Realm()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FavCell", bundle: nil), forCellReuseIdentifier: Constants.FavCell)
        
        fetchData()
    }
    
    func fetchData() {
        favoriteMoviesArray = realm.objects(Movie.self)
    }
    
    //MARK: Delegation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell tapped. This is cell number \(indexPath.row + 1)")
    }
    
    //MARK: Data Sourcing
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FavCell, for: indexPath) as! FavCell
        return cell
    }
    
    
}
