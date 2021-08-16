//
//  AppleMoviesViewModel.swift
//  CiceMovies
//
//  Created by cice on 14/06/2021.
//

import Foundation

struct AppleMoviesViewModel: Identifiable {
    let id: String?
    let name: String?
    let artworkUrl100: String?
    
    init(businessModel: ResultMovies) {
        self.id = businessModel.id
        self.name = businessModel.name
        self.artworkUrl100 = businessModel.artworkUrl100
    }
}
