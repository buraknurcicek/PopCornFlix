//
//  LocalizableManager.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

public enum PopCornFlixLocalizables: GenericValueProtocol {

    public typealias Value = String

    case movie
    case movieDetail
   
    public var value: String {
        switch self {
        case .movie:
            return "Movie".toLocalize()
        case .movieDetail:
            return "Movie Detail".toLocalize()

        }
    }
}
