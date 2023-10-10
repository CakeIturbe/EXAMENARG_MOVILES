//
//  ContentView.swift
//  MovieResume
//
//  Created by Diego Iturbe on 10/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardCarteleraView: View {
    @StateObject var viewModel: MovieViewModel
    var movieId: UUID
    var movieName: String
    var votos: Int
    var fecha_estreno: String
    
    init(movieId: UUID, movieName: String, votos: Int, fecha_estreno: String) {
        _viewModel = StateObject(wrappedValue: MovieViewModel())
        
        self.movieId = movieId
        self.movieName = movieName
        self.votos = votos
        self.fecha_estreno = fecha_estreno
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10, style:.continuous)
                .fill(.white)
                .frame(width: 335, height: 150)
                .shadow(color: Color("BlueCustom"), radius: 1)
            HStack {
                Text(movieName)
            }
            .navigationTitle("CARTELErA")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = MovieViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.movies, id: \.id) { movie in
                        CardCarteleraView(movieId: movie.id,
                                          movieName: movie.title, votos: movie.vote_average, fecha_estreno: movie.release_date)
                    }.padding(.top, 5)
                }.padding(.top, 10)
            }.onAppear {
                Task {
                    await viewModel.fetchAllMovies()
                }
            }
        }
        
    }
}

