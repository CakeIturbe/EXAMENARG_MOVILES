//
//  TMBDRepository.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//
import Foundation

struct Api {
    static let base = "https://api.themoviedb.org/3/movie"
    struct routes {
        static let movie = "/popular/"
    }
}


class TMBDRepository {
    let nservice: NetworkAPIService
    static let shared = TMBDRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }

    func getAllMovies() async -> PaginatedQuery<Movie>? {
        return await nservice.getCartelera(url: URL(string:"\(Api.base)\(Api.routes.movie)")!)
    }
    /*
    func getMovieInfo(numberMovie: Int) async -> Movie? {
       
        return await nservice.getMovieInfo(url: URL(string:"\(Api.base)\(Api.routes.movie)/\(numberMovie)")!)
        
    }
     */
}
