//
//  ContentView.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var movieList = [MovieBase]()
    var body: some View {
        List(movieList) { movieBase in
            HStack {
                WebImage(url: URL(string: movieBase.perfil?.sprites.front_default ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                Text(movieBase.movie.name)
            }
        }.onAppear {
            Task {
                await getMovieList()
            }
        }
    }

    func getMovieList() async {
        let movieRepository = TMBDRepository()
        let result = await movieRepository.getMovieList(limit: 15)
        
        var tempMovieList = [MovieBase]()
        for movie in result!.results {
            let numberMovie = Int(movie.url.split(separator: "/")[5])!
            
            let infoMovie = await movieRepository.getMovieInfo(numberMovie: Int(String(numberMovie))!)
            let tempMovie = MovieBase(id: Int(String(numberMovie))!, movie: movie, perfil: infoMovie)
            tempMovieList.append(tempMovie)
        }
        movieList = tempMovieList
    }
}

