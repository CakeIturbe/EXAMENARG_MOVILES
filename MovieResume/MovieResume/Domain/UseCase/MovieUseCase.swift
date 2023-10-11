//
//  MovieUseCase.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import Foundation
@MainActor
/// Definición de Caso de uso para hacer el get
class MovieUseCase {
    static let shared = MovieUseCase()
    let mRepository = TMBDRepository.shared
    func getAllMovies() async -> PaginatedQuery<Movie>? {
        return await mRepository.getAllMovies()
    }
}

/*
protocol NetworkAPIProtocol {
    // https://pokeapi.co/api/v2/pokemon/limit=1279
    func getMovieList(limit: Int) async -> Cartelera?
    // https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getMovieInfo(numberMovie:Int) async -> Movie?
}
*/
