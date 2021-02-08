//
//  MovieDetailPresenter.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

final class MovieDetailPresenter {
    
    // MARK: - Private properties -
    private unowned let view: MovieDetailViewInterface
    private let interactor: MovieDetailInteractorInterface
    private let wireframe: MovieDetailWireframeInterface
    
    lazy var favoriteManager: FavoriteManagerProtocol = FavoriteManager()
    
    // MARK: - Lifecycle -
    init(view: MovieDetailViewInterface, interactor: MovieDetailInteractorInterface, wireframe: MovieDetailWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension MovieDetailPresenter: MovieDetailPresenterInterface {
    func getMovieDetail(id: Int) {
        interactor.getMovieDetail(id: id)
    }
    
    func setMovieData(movie: Movie) {
        view.setMovieData(movie: movie)
    }
    
    
    func completedWithError() {
        wireframe.completedWithError()
    }
    
}
