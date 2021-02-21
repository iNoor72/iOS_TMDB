//
//  HomeVC.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import UIKit
import Alamofire

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK:- CollectionView functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    @IBOutlet weak var popularCV: UICollectionView!
    @IBOutlet weak var topRatedCV: UICollectionView!
    @IBOutlet weak var nowPlayingCV: UICollectionView!
    
    override func viewDidLoad() {
        popularCV.delegate = self
        topRatedCV.delegate = self
        nowPlayingCV.delegate = self
        popularCV.dataSource = self
        topRatedCV.dataSource = self
        nowPlayingCV.dataSource = self
        
        fetchTopRated()
        fetchNowPlaying()
    }
}
func fetchNowPlaying() {
    let url = MovieRouter.nowPlaying
    AF.request(url).responseDecodable { (response: (DataResponse<[Movie], AFError>)) in
        switch response.result {
        case .success(let movies):
            print("Done")
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
