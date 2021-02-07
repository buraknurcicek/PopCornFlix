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
            return "movie".toLocalize()
        case .movieDetail:
            return "movieDetail".toLocalize()
        case .error:
            return "error".toLocalize()
        case .message:
            return "errorMessage".toLocalize()
        case .done:
            return "done".toLocalize()
        case .loadMore:
            return "loadMore".toLocalize()
        }
    }
}
