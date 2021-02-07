//
//  FavoriteManager.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

protocol FavoriteManagerProtocol {
    func getFavorites()
    func favoriteAction(id: Int)
    var favorites: [Int] { get set }
    var favoritesChanged: (([Int]) -> Void)? { get set }
}

final class FavoriteManager: FavoriteManagerProtocol {
    
    var userDefaults = UserDefaults.standard
    
    var favorites: [Int] = [] {
        didSet {
            favoritesChanged?(favorites)
            print(favorites)
            setLocale()
        }
    }
    
    var favoritesChanged: (([Int]) -> Void)?
    
    func getFavorites() {
        self.favorites = getLocale()
    }
    
    func favoriteAction(id: Int) {
        guard let index = favorites.firstIndex(of: id) else {
            favorites.append(id)
            return
        }
        
        favorites.remove(at: index)
    }
    
    func getLocale() -> [Int] {
        guard let movies = userDefaults.array(forKey: "favorites") as? [Int] else { return [] }
        print("get return ",movies)
        return movies
    }
    
    func setLocale() {
        userDefaults.setValue(favorites, forKey: "favorites")
        print("set return ",favorites)
        
    }
    
}
