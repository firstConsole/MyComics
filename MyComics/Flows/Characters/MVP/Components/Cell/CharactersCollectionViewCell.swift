//
//  CharactersCollectionViewCell.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

final class CharactersCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        static let standardCornerInset: CGFloat = 10
    }
    
    // MARK: - Private Properties
    
    private let imageView = AsyncImageView()
    private let titleLabel = UILabel()
    private let detailStackView = DetailStackView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.asyncImage = nil
        titleLabel.text = ""
    }
    
    // MARK: - Public Methods
    
    func configure(_ model: Model) {
        imageView.asyncImage = model.image
        titleLabel.text = model.title
    }
}

// MARK: - Private Methods

private extension CharactersCollectionViewCell {
    func setupUI() {
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 10
        addSubviews()
        setupImageView()
        setupTitleLabel()
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailStackView)
    }
    
    func setupConstraints() {
        // imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        // titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.standardCornerInset),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.standardCornerInset)
        ])
        
        // detailStackView
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            detailStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.standardCornerInset),
            detailStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.standardCornerInset),
            detailStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
        ])
        
        self.subviews.forEach { subviews in
            subviews.constraints.forEach { $0.priority = .sceneSizeStayPut }
        }
    }
    
    func setupImageView() {
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.contentScaleFactor = 0.5
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.maximumContentSizeCategory = .small
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
    }
}
