//
//  PopCornFlixClient.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

protocol PopCornFlixClientProtocol {
    func getPopularMovies(pagination: Int, completion: @escaping (_ movieList: MovieList?, _ error: Error?) -> Void)
    func movieDetail(id: Int, completion: @escaping (_ movie: Movie?, _ error: Error?) -> Void)
}

class PopCornFlixClient: PopCornFlixClientProtocol {
    
    private let serviceClient: ServiceClientProtocol
    
    init(serviceClient: ServiceClientProtocol = ServiceClient()) {
        self.serviceClient = serviceClient
    }
    
    func getPopularMovies(pagination: Int, completion: @escaping (_ movieList: MovieList?, _ error: Error?) -> Void) {
        serviceClient.makeRequestWithData(route: PopCornFlixRouter.popularMovies(pagination: pagination)) { (response, error) in
            guard let data = response,
                  let movieList = self.convertToModel(data: data, decodingType: MovieList.self) else {
                completion(nil, error)
                return
            }
            
            completion(movieList, nil)
        }
    }
    
    func movieDetail(id: Int, completion: @escaping (_ movie: Movie?, _ error: Error?) -> Void) {
        serviceClient.makeRequestWithData(route: PopCornFlixRouter.movieDetail(id: id)) { (response, error) in
            guard let data = response,
                  let movie = self.convertToModel(data: data, decodingType: Movie.self) else {
                completion(nil, error)
                return
            }
            
            completion(movie, nil)
        }
    }
    
    func convertToModel<T: Codable>(data: Data, decodingType: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print(error)
            return nil
        }
    }
}
