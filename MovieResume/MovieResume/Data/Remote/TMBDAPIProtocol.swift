//
//  TMBDApiProtocol.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//


import Foundation

//https://api.themoviedb.org/3/movie/popular/
protocol TMBDAPIProtocol {
    func getAllMovies() async -> PaginatedQuery<Movie>??
}
