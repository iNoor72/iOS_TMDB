//
//  AFNetworking.swift
//  TMDB
//
//  Created by Noor Walid on 12/02/2021.
//

import Foundation
import Alamofire

enum AFNetworking: URLRequestConvertible {

    static let baseURL = "https://api.themoviedb.org/3/movie"
    
    case topRated
    case nowPlaying
    
    var method: HTTPMethod {
        switch self {
        case .topRated:
            return HTTPMethod(rawValue: "GET")
        case .nowPlaying:
            return HTTPMethod(rawValue: "GET")
        }
        
    }
    
    var path: String {
        switch self {
        case .topRated:
            return "/top_rated?api_key=\(Constants.API_key)&language=en-US&page=1"
        case .nowPlaying:
            return "/now_playing?api_key=\(Constants.API_key)&language=en-US&page=1"
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = URL(string: AFNetworking.baseURL)
        var request = URLRequest(url: (url?.appendingPathComponent(path))!)
        
        return request
    }
    
    
}

