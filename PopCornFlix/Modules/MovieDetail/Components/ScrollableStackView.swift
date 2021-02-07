//
//  ScrollableStackView.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

// MARK: - ScrollableStackView
class ScrollableStackView: UIView {

    // MARK: - Properties
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setup() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

                                     stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

                                     stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
}
