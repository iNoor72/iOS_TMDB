//
//  FavoritesVC.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let array = ["A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        
        //cell.movieName.text = array[indexPath.row]
        return cell
    }
    
    
}
