//
//  MovieDetailWireframe.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
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
        let alert = UIAlertController(title: PopCornFlixLocalizables.error.value, message: PopCornFlixLocalizables.message.value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: PopCornFlixLocalizables.done.value, style: .default, handler: nil))
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
