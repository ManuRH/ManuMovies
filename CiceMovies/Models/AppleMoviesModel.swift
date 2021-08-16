//
//  AppleMoviesModel.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation

// MARK: - AppleMoviesModel
struct AppleMoviesServerModel: Codable {
    let feed: Feed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultMovies]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Link
struct Link: Codable, Identifiable {
    var id = UUID()
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}

// MARK: - Result
struct ResultMovies: Codable, Identifiable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: Kind?
    let copyright: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case kind = "kind"
        case copyright = "copyright"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name = "name"
        case url = "url"
    }
}

enum Kind: String, Codable {
    case movie = "movie"
}

extension AppleMoviesServerModel {
    
    static var stubbedMovies: [ResultMovies] {
        let response: AppleMoviesServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "movies")
        return response?.feed?.results ?? []
    }
    
    static var stubbedResultMovie: ResultMovies {
        stubbedMovies[0]
    }
}



