//
//  MoviePresenter.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MoviePresenter {

    // MARK: - Private properties -

    private unowned let view: MovieViewInterface
    private let interactor: MovieInteractorInterface
    private let wireframe: MovieWireframeInterface

    // MARK: - Lifecycle -

    init(view: MovieViewInterface, interactor: MovieInteractorInterface, wireframe: MovieWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MoviePresenter: MoviePresenterInterface {
    func openMovieDetailModule() {
        wireframe.openMovieDetailModule()
    }
    
}
