//
//  File.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import Foundation

struct Cartelera: Codable {
    var count: Int
    var results: [Movie]
}

struct Movie : Codable, Identifiable {
    var adult : Bool
    var backdrop_path : String
    var genre_ids : [String]
    var id : UUID
    var original_language : String
    var original_title : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var release_date : String
    var title : String
    var video : Bool
    var vote_average : Int
    var vote_count : Int

}
/*
struct Perfil: Codable {
    var sprites: Sprite
}

struct Sprite: Codable{
    var front_default: String
    var back_default: String
}

struct MovieBase: Identifiable {
    var id: Int
    var movie: Movie
    var perfil: Perfil?
}
*/
/*
protocol NetworkAPIProtocol {
    // https://pokeapi.co/api/v2/pokemon/limit=1279
    func getMovieList(limit: Int) async -> Cartelera?
    // https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getMovieInfo(numberMovie:Int) async -> Movie?
}

*/


