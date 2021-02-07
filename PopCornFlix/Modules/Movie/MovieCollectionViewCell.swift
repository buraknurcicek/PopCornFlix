//
//  MovieCollectionViewCell.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties -
    static let identifier = "MovieCollectionViewCell"
    
    lazy var movieImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Deneme"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup -
    private func setup() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

                                     titleView.heightAnchor.constraint(equalToConstant: 50),
                                     titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     titleView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
                                     
                                     titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
                                     titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
                                     titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
                                      
                                     favoriteButton.widthAnchor.constraint(equalToConstant: 25),
                                     favoriteButton.heightAnchor.constraint(equalToConstant: 25),
                                     favoriteButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -20),
                                     favoriteButton.topAnchor.constraint(equalTo: titleView.topAnchor, constant: -20),
                                                                       
        
        
        ])

    }
    
    
}
