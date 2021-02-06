//
//  MovieViewController.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: MoviePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}

// MARK: - Extensions -

extension MovieViewController: MovieViewInterface {
}