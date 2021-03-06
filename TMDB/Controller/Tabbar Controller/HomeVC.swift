//
//  HomeVC.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import UIKit
import Alamofire

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var popularCV: UICollectionView!
    @IBOutlet weak var topRatedCV: UICollectionView!
    @IBOutlet weak var nowPlayingCV: UICollectionView!
    
    let urlFetcher = URLSession_Networking()
    let array = ["1","2","3"]
    
    let popularCollectionView = UICollectionView()
    let topRatedCollectionView = UICollectionView()
    let nowPlayingCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        popularCV.delegate = self
        topRatedCV.delegate = self
        nowPlayingCV.delegate = self
        popularCV.dataSource = self
        topRatedCV.dataSource = self
        nowPlayingCV.dataSource = self
        popularCV.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: Constants.MovieCell)
        fetchPopular()
        fetchTopRated()
        fetchNowPlaying()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK:- CollectionView functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            
        }
        else if collectionView == self.nowPlayingCollectionView {
            
        }
        else {
            
        }
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            let cell = popularCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.movieName.text = "Noor"
            cell.movieImage.backgroundColor = .brown
            return cell
        }
        else if collectionView == self.nowPlayingCollectionView {
            let cell = nowPlayingCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.movieName.text = "Noor"
            cell.movieImage.backgroundColor = .brown
            return cell
        }
        else {
            let cell = topRatedCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.movieName.text = "Noor"
            cell.movieImage.backgroundColor = .brown
            return cell
        }
        
    }
    
    //MARK:- Fetching Data Methods
    
    func fetchPopular() {
        urlFetcher.fetchData()
    }
    
    func fetchNowPlaying() {
        let url = MovieRouter.nowPlaying
        AF.request(url).responseDecodable { (response: (DataResponse<[Movie], AFError>)) in
            switch response.result {
            case .success(let movies):
                print("Done and Noor")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTopRated() {
        let url = MovieRouter.topRated
        AF.request(url).responseDecodable { (response: (DataResponse<[Movie], AFError>)) in
            switch response.result {
            case .success(let movies):
                print("Done")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

