//
//  TMBDRepository.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//
import Foundation

struct Api {
    static let base = "https://api.themoviedb.org/3/"
    struct routes {
        static let movie = "/movie"
    }
}

class TMBDRepository: TMBDAPIProtocol {
    let nservice: NetworkAPIService

    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }

    func getMovieList(limit: Int) async -> Cartelera? {
        return await nservice.getCartelera(url: URL(string:"\(Api.base)\(Api.routes.movie)")!, limit: limit)
    }
    
    func getMovieInfo(numberMovie: Int) async -> Perfil? {
       
        return await nservice.getMovieInfo(url: URL(string:"\(Api.base)\(Api.routes.movie)/\(numberMovie)")!)
        
    }
}
