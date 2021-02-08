//
//  MoviePresenter.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

final class MoviePresenter {
    
    // MARK: - Private properties -
    private unowned let view: MovieViewInterface
    private let interactor: MovieInteractorInterface
    private let wireframe: MovieWireframeInterface
    
    var movies: [Movie] = []
    var favoriteMovies: [Int] = []
    
    lazy var favoriteManager: FavoriteManagerProtocol = FavoriteManager()
    
    // MARK: - Lifecycle -
    init(view: MovieViewInterface, interactor: MovieInteractorInterface, wireframe: MovieWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension MoviePresenter: MoviePresenterInterface {
    func getPopularMovies(pagination: Int) {
        interactor.getPopularMovies(pagination: pagination)
    }
    
    func setPopularMovies(movieList: MovieList) {
        guard let movies = movieList.movies else { return }
        self.movies.append(contentsOf: movies)
        view.setPopularMovies(movies: self.movies)
    }
    
    func search(query: String) {
        let filtered = movies.filter{($0.title?.contains(query) ?? false)}
        query == "" ? view.getFilteredMovies(filteredMovies: movies) : view.getFilteredMovies(filteredMovies: filtered)
    }
    
    func completedWithError() {
        wireframe.completedWithError()
    }
    
    func openMovieDetailModule(data: MovieDetailWireFrameData) {
        wireframe.openMovieDetailModule(data: data)
    }
    
}
