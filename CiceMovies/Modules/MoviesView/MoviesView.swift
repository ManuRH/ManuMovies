//
//  MoviesView.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var presenter = MoviesPresenterImpl()
    
    var body: some View { 
        List{
            Group{
                if self.presenter.arrayMovies.isEmpty {
                    CarrouselPostArtView(modelData: self.presenter.arrayMovies, title: "Aqui Andres")
                } else {
                    CarrouselPostArtView(modelData: self.presenter.arrayMovies, title: "Aqui Andres")
                }
            }
            Group{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
                    ForEach(self.presenter.arrayMovies) { item in
                        PosterCardArtworkView(model: item)
                    }
                }.padding()
            }
            
        }
        .onAppear(perform: {
            self.presenter.fetchDataMovies()
        })
        .navigationTitle("Hola a todos")
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
