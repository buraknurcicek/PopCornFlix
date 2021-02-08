//
//  MovieDetailViewController.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    // MARK: - Properties -
    lazy var scrollableStackView: ScrollableStackView = {
        let scrollableStackView = ScrollableStackView()
        scrollableStackView.translatesAutoresizingMaskIntoConstraints = false
        return scrollableStackView
    }()
    
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var movieVoteCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var rightBarButtonItem: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(VisualConstants.CommonIcons.unfavorite.value, for: .normal)
        button.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return button
    }()

    lazy var popCornFlixClient: PopCornFlixClientProtocol = PopCornFlixClient()
    lazy var favoriteManager: FavoriteManagerProtocol = FavoriteManager()
    var presenter: MovieDetailPresenterInterface!
    var id: Int
    var isFavorited = false
    var favoritedMovies: [Int] = []
    
    // MARK: - Init-
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.getMovieDetail(id: id)
        getFavorites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteManager.getFavorites()
    }
    
    // MARK - Setup -
    private func configureNavigationBar() {
        view.backgroundColor = .white
        title = PopCornFlixLocalizables.movieDetail.value
        let barButton = UIBarButtonItem(customView: rightBarButtonItem)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    private func setup() {
        configureNavigationBar()
        addSubViews()
        insertSubViews()
    }
    
    private func addSubViews() {
        view.addSubview(movieImageView)
        view.addSubview(scrollableStackView)
        
        NSLayoutConstraint.activate([movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     movieImageView.heightAnchor.constraint(equalToConstant: 250),
                                    
                                     scrollableStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
                                     scrollableStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     scrollableStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     scrollableStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)])
    }
    
    private func insertSubViews() {
        scrollableStackView.stackView.insertArrangedSubview(movieNameLabel, at: scrollableStackView.stackView.arrangedSubviews.count)
        scrollableStackView.stackView.insertArrangedSubview(movieDescriptionLabel, at: scrollableStackView.stackView.arrangedSubviews.count)
        scrollableStackView.stackView.insertArrangedSubview(movieVoteCountLabel, at: scrollableStackView.stackView.arrangedSubviews.count)
    }
    
    // MARK - Functions -
    private func getFavorites() {
         favoriteManager.favoritesChanged = { favorites in
             self.favoritedMovies = favorites
             self.configureFavoriteButton(isFavorited: favorites.contains(self.id))
         }
     }
    
    // MARK - Actions -
    @objc func favoriteTapped() {
        isFavorited.toggle()
        configureFavoriteButton(isFavorited: isFavorited)
        favoriteManager.favoriteAction(id: id)
    }
    
    func configureFavoriteButton(isFavorited: Bool) {
        isFavorited ? rightBarButtonItem.setImage(VisualConstants.CommonIcons.favorite.value, for: .normal) : rightBarButtonItem.setImage(VisualConstants.CommonIcons.unfavorite.value, for: .normal)
    }

}

// MARK: - Extensions -
extension MovieDetailViewController: MovieDetailViewInterface {
    func setMovieData(movie: Movie) {
        movieNameLabel.text = "Title: \(movie.title ?? "")"
        movieDescriptionLabel.text = "Description: \(movie.overview ?? "")"
        movieVoteCountLabel.text = "Vote count: \(String(movie.voteCount ?? 0))"
        movieImageView.kf.setImage(with: URL(string: NetworkConstants.imageBaseURL + (movie.posterPath ?? "")), placeholder: VisualConstants.CommonIcons.moviePlaceholder.value)
    }
    
}
