//
//  BaseVIP.swift
//  CiceMovies
//
//  Created by cice on 11/06/2021.
//

import Foundation

protocol BaseInteractorInputProtocol: class {}
protocol BaseInteractorOutputProtocol: class {}

class BasePresenter {
    internal var baseInteractor: BaseInteractorInputProtocol?
    required init() {}
}

class BaseInteractor {
    internal weak var basePresenter: BaseInteractorOutputProtocol?
    required init() {}
}

class BaseCoordinator {
    static func assembly<Presenter: BasePresenter, Interactor: BaseInteractor>(presenter: Presenter.Type, interactor: Interactor.Type) -> (presenter: Presenter, intetactor: Interactor) {
        let basePresenter = Presenter()
        let baseInteractor = Interactor()
        basePresenter.baseInteractor = baseInteractor as? BaseInteractorInputProtocol
        baseInteractor.basePresenter = basePresenter as? BaseInteractorOutputProtocol
        return (basePresenter, baseInteractor)
    }
}
