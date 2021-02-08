//
//  MovieWireframe.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

final class MovieWireframe: BaseWireframe {
    
    // MARK: - Private properties -
    
    // MARK: - Module setup -
    init() {
        let moduleViewController = MovieViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = MovieInteractor()
        let presenter = MoviePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Extensions -
extension MovieWireframe: MovieWireframeInterface {
    func openMovieDetailModule(data : MovieDetailWireFrameData) {
        self.navigationController?.pushWireframe(MovieDetailWireframe(data: data))
    }
    
    func completedWithError() {
        let alert = UIAlertController(title: PopCornFlixLocalizables.error.value, message: PopCornFlixLocalizables.message.value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: PopCornFlixLocalizables.done.value, style: .default, handler: nil))
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}
