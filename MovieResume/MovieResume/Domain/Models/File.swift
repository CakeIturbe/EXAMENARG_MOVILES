//
//  File.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import Foundation

import Foundation

struct Cartelera: Codable {
    var count: Int
    var results: [Movie]
}

struct Movie: Codable {
    var name: String
    var url: String
}

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


protocol NetworkAPIProtocol {
    // https://pokeapi.co/api/v2/pokemon/limit=1279
    func getPokemonList(limit: Int) async -> Cartelera?
    // https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}



