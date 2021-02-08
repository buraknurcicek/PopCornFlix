//
//  MovieInteractor.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

final class MovieInteractor {
    
    // MARK: - Properties -
    var presenter: MoviePresenter?
    var movieList: MovieList?
    lazy var popCornFlixClient: PopCornFlixClientProtocol = PopCornFlixClient()
}

// MARK: - Extensions -
extension MovieInteractor: MovieInteractorInterface {
    func getPopularMovies(pagination: Int) {
        popCornFlixClient.getPopularMovies(pagination: pagination) { [weak self] (movieList, error) in
            guard let self = self else { return }
            if let movieList = movieList {
                self.presenter?.setPopularMovies(movieList: movieList)
            } else {
                self.presenter?.completedWithError()
            }
        }
    }
}
