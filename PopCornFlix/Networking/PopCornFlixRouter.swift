//
//  PopCornFlixRouter.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation
import Alamofire

enum PopCornFlixRouter: URLRequestConvertible {
    
    static let baseURLPath = NetworkConstants.baseURL
    
    case popularMovies(pagination: Int)
    case movieDetail(id: Int)
    
    var method: HTTPMethod {
        switch self {
        case .popularMovies, .movieDetail:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/popular"
        case .movieDetail(id: let id):
            return "/\(id)"
        default:
            return ""
        }
    }
    
    var parameters: [String: String] {
        
        switch self {
        case .popularMovies(pagination: let pagination):
            return ["language": "en-US" ,"api_key": NetworkConstants.apiKey, "page": "\(pagination)"]
        case .movieDetail:
            return ["language": "en-US" ,"api_key": NetworkConstants.apiKey]
        }
    }
    
    // MARK: - URLRequest
    public func asURLRequest() throws -> URLRequest {
        
        let url = try PopCornFlixRouter.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 20
    
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
