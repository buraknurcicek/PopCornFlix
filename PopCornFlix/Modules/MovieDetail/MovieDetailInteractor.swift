//
//  MovieDetailInteractor.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

final class MovieDetailInteractor {
    
    // MARK: - Properties -
    var presenter: MovieDetailPresenter?
    lazy var popCornFlixClient: PopCornFlixClientProtocol = PopCornFlixClient()
    var movie: Movie?
}

// MARK: - Extensions -
extension MovieDetailInteractor: MovieDetailInteractorInterface {
    func getMovieDetail(id: Int) {
        popCornFlixClient.movieDetail(id: id, completion: { [weak self]  (movie, error) in
            guard let self = self else { return }
            if let movie = movie {
                self.presenter?.setMovieData(movie: movie)
            } else {
                self.presenter?.completedWithError()
            }
        })
    }
    
}
