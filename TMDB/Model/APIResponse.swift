//
//  APIResponse.swift
//  TMDB
//
//  Created by Noor Walid on 03/02/2021.
//

import Foundation

struct APIResponse {
    let popularURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.API_key)&language=en-US&page=1"
    let topRatedURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(Constants.API_key)&language=en-US&page=1"
    let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Constants.API_key)&language=en-US&page=1"
    
    func fetchData() {
        performFetching(urlString: popularURL)
        performFetching(urlString: topRatedURL)
        performFetching(urlString: nowPlayingURL)
    }
    
    func performFetching(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            task.resume()
        }
    }
    
    func handler (data: Data?, response:URLResponse?, error:Error?) -> Void {
        if (error != nil) {
            debugPrint(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)!
            print(dataString)
        }
    }
}
