//
//  MovieViewController.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit
import Kingfisher

final class MovieViewController: UIViewController {
    
    // MARK: - Public properties -
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.keyboardDismissMode = .onDrag
        collectionView.backgroundColor = .white
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var loadMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loadMoreButtonTapped), for: .touchUpInside)
        button.isHidden = true
        button.setTitle(PopCornFlixLocalizables.loadMore.value, for: .normal)
        return button
    }()
    
    var presenter: MoviePresenterInterface!
    var movies: [Movie] = []
    var favorites: [Int] = []
    var paginationIndex = 1
    
    lazy var favoriteManager: FavoriteManagerProtocol = FavoriteManager()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getPopularMovies(pagination: paginationIndex)
        getFavorites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteManager.getFavorites()
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    // MARK: - Setup -
    func setup() {
        view.backgroundColor = .white
        title = PopCornFlixLocalizables.movie.value
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        view.addSubview(loadMoreButton)
        
        NSLayoutConstraint.activate([searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     
                                     loadMoreButton.widthAnchor.constraint(equalToConstant: 100),
                                     loadMoreButton.heightAnchor.constraint(equalToConstant: 50),
                                     loadMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     loadMoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)])
    }
    
    // MARK: - Functions -
    private func getFavorites() {
        favoriteManager.favoritesChanged = { favorites in
            self.favorites = favorites
            self.reloadCollectionView()
        }
    }
    
    @objc func loadMoreButtonTapped(sender : UIButton) {
        loadMoreButton.isHidden = true
        searchBar.text = ""
        searchBar.endEditing(true)
        paginationIndex += 1
        presenter.getPopularMovies(pagination: paginationIndex)
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoadMoreButton(){
        loadMoreButton.isHidden = false
    }
    
}

// MARK: - Extensions -
extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = movies[indexPath.row].id else { return }
        let data = MovieDetailWireFrameData(id: id)
        presenter.openMovieDetailModule(data: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            showLoadMoreButton()
        }
    }
}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.titleLabel.text = movies[indexPath.row].title
        cell.favoriteImageView.isHidden = favorites.contains(movies[indexPath.row].id ?? 0) ? false : true
        cell.movieImageView.kf.setImage(with: URL(string: NetworkConstants.imageBaseURL + (movies[indexPath.row].posterPath ?? "")), placeholder: VisualConstants.CommonIcons.moviePlaceholder.value)
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 15
        let widthPerItem = collectionView.frame.width / 2 - padding
        return CGSize(width:widthPerItem, height:250)
    }
}

extension MovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(query: searchText)
    }
}

extension MovieViewController: MovieViewInterface {
    func getFilteredMovies(filteredMovies: [Movie]) {
        self.movies = filteredMovies
        reloadCollectionView()
    }
    
    func setPopularMovies(movies: [Movie]) {
        self.movies = movies
        reloadCollectionView()
    }
}
