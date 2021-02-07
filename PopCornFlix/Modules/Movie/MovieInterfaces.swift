//
//  MovieInterfaces.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol MovieWireframeInterface: WireframeInterface {
    func openMovieDetailModule(data: MovieDetailWireFrameData)
}

protocol MovieViewInterface: ViewInterface {
    func setPopularMovies(movies: [Movie])
    func getFilteredMovies(filteredMovies: [Movie])
}

protocol MoviePresenterInterface: PresenterInterface {
    func openMovieDetailModule(data: MovieDetailWireFrameData)
    func getPopularMovies(pagination: Int)
    func completedWithError()
    func setPopularMovies(movieList: MovieList)
    func search(query: String)
}

protocol MovieInteractorInterface: InteractorInterface {
    func getPopularMovies(pagination: Int)
}
