//
//  MovieDetailInterfaces.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

protocol MovieDetailWireframeInterface: WireframeInterface {
    func completedWithError()
}

protocol MovieDetailViewInterface: ViewInterface {
    func setMovieData(movie: Movie)
}

protocol MovieDetailPresenterInterface: PresenterInterface {
    func getMovieDetail(id: Int)
    func setMovieData(movie: Movie)
    func completedWithError()
}

protocol MovieDetailInteractorInterface: InteractorInterface {
    func getMovieDetail(id: Int)
}
