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
    
    var popArray = [Movie]()
    var topArray = [Movie]()
    var nowArray = [Movie]()
    
    override func viewDidLoad() {
        popularCV.delegate = self
        topRatedCV.delegate = self
        nowPlayingCV.delegate = self
        popularCV.dataSource = self
        topRatedCV.dataSource = self
        nowPlayingCV.dataSource = self
        popularCV.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: Constants.MovieCell)
        topRatedCV.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: Constants.MovieCell)
        nowPlayingCV.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: Constants.MovieCell)
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
        if collectionView == popularCV {
//            return popArray.count
            return 3
        }
        else if collectionView == nowPlayingCV {
            return nowArray.count
        }
        return topArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCV {
            let cell = popularCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
//            cell.movieName.text = popArray[indexPath.row].title
            cell.movieName.text = "Noor"
            
            return cell
        }
        else if collectionView == nowPlayingCV {
            let cell = nowPlayingCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.movieName.text = nowArray[indexPath.row].title
            return cell
        }
        else {
            let cell = topRatedCV.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.movieName.text = topArray[indexPath.row].title
            return cell
        }
    }
    
    //MARK:- Fetching Data Methods
    
    func fetchPopular() {
        urlFetcher.fetchData()
        DispatchQueue.main.async { [weak self] in
            self?.popularCV.reloadData()
        }
        
    }
    
    func fetchNowPlaying() {
        let url = MovieRouter.nowPlaying
        AF.request(url).responseDecodable {[weak self] (response: (DataResponse<[Movie], AFError>)) in
            switch response.result {
            case .success(let movies):
                self?.nowArray = movies
                DispatchQueue.main.async {
                    self?.nowPlayingCV.reloadData()
                }
                print("Data retrieved for nowPlaying using URLSession")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTopRated() {
        let url = MovieRouter.topRated
        AF.request(url).responseDecodable {[weak self] (response: (DataResponse<[Movie], AFError>)) in
            switch response.result {
            case .success(let movies):
                self?.topArray = movies
                DispatchQueue.main.async {
                    self?.topRatedCV.reloadData()
                }
                print("Data retrieved for topRated using URLSession")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

