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
    case error
    case message
    case done
    case loadMore
    
    public var value: String {
        switch self {
        case .movie:
            return "Movie".toLocalize()
        case .movieDetail:
            return "Movie Detail".toLocalize()
        case .error:
            return "Error".toLocalize()
        case .message:
            return "Something happened".toLocalize()
        case .done:
            return "Done".toLocalize()
        case .loadMore:
            return "Load More".toLocalize()
        }
    }
}
