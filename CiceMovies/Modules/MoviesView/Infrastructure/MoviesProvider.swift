//
//  MoviesProvider.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation
import Combine

protocol MoviesProviderProtocol {
    func fetchMovies(top: String, all: String, number: String, completionHandler: @escaping (Result<AppleMoviesServerModel, NetworkingError>) -> ())
}

class MoviesProviderImpl: MoviesProviderProtocol {
    
    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    func fetchMovies(top: String, all: String, number: String, completionHandler: @escaping (Result<AppleMoviesServerModel, NetworkingError>) -> ()) {
        
        let aux: [CVarArg] = [top, all, number]
        let endpointComplete = String(format: URLEndpoint.endpointMovies, arguments: aux)
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: endpointComplete,
                                 urlContext: .backend)
        
        self.provider.requestGeneric(requestDto: request, entityClass: AppleMoviesServerModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] responseMoviesModel in
            guard self != nil else { return }
            completionHandler(.success(responseMoviesModel))
        }.store(in: &cancellable)
        
    }
}
