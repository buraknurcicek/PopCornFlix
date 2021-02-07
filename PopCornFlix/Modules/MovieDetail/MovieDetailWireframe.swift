//
//  MovieDetailWireframe.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(data: MovieDetailWireFrameData) {
        let moduleViewController = MovieDetailViewController(id: data.id)
        super.init(viewController: moduleViewController)

        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieDetailWireframe: MovieDetailWireframeInterface {
    func completedWithError() {
        
    }
    
}
