//
//  MovieViewModel.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import Foundation

/// Implementación de view model de modelo de Movie
class MovieViewModel: ObservableObject {
  /// Caso de uso para hacer fetch de los datos de peliculas
  private let useCase: MovieUseCase
  
  
  @Published var movies = [Movie]()
  
  /// La pelicula puede cambiar en la vista (se construye .onAppear())
  @Published var contentMovie: Movie = Movie(
    adult : false,
    backdrop_path : " ",
    genre_ids : [],
    id : UUID(uuidString: "") ?? UUID(),
    original_language : "",
    original_title : "",
    overview : "",
    popularity : 0.00,
    poster_path : "",
    release_date : "",
    title : "",
    video : false,
    vote_average : 0,
    vote_count : 0
  )
  
  /// Para implementar el caso de uso en la vista que llame al ViewModel Movie
  init(useCase: MovieUseCase = MovieUseCase.shared) {
    self.useCase = useCase
  }
  
  @MainActor
  func fetchAllMovies() async {
    self.movies = await useCase.getAllMovies()!.rows
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




