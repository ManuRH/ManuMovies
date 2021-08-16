//
//  MoviesCoordinator.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseCoordinator {
    
    static func navigation() -> NavigationView<MoviesView> {
        let customNavigationView = NavigationView{
            self.buildView()
        }
        return customNavigationView
    }
    
    static func buildView(dto: MoviesDTO? = nil) -> MoviesView {
        var view = MoviesView()
        let vip = BaseCoordinator.assembly(presenter: MoviesPresenterImpl.self, interactor: MoviesInteractorImpl.self)
        view.presenter = vip.presenter
        return view
    }
    
}

struct MoviesDTO {
    
}
