//
//  CharacterDetailView.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: DetailCharacterViewOutput
    
    private let characterImageView: AsyncImageView = {
        let characterImageView = AsyncImageView()
        characterImageView.contentMode = .scaleAspectFit
        return characterImageView
    }()
    
    private var nameCharacterLabel: UILabel = {
        let nameCharacterLabel = UILabel()
        nameCharacterLabel.textColor = .white
        nameCharacterLabel.font = .systemFont(ofSize: 23, weight: .bold)
        nameCharacterLabel.textAlignment = .center
        return nameCharacterLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        descriptionLabel.numberOfLines = 10
        return descriptionLabel
    }()
    
    private let likeBarButtonItem: UIBarButtonItem = {
        let likeBarButtonItem = UIBarButtonItem()
        likeBarButtonItem.image = UIImage(systemName: "heart.fill")
        likeBarButtonItem.tintColor = UIColor(named: "custom_red")
        return likeBarButtonItem
    }()
    
    // MARK: - Init
    
    init(presenter: DetailCharacterViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewIsReady()
    }
    
    // MARK: - Private methods
    
    private func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = likeBarButtonItem
        view.backgroundColor = .commonBackground
        view.addSubview(descriptionLabel)
        view.addSubview(nameCharacterLabel)
        view.addSubview(characterImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            characterImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor)
        ])
        
        nameCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - DetailCharacterViewInput -

extension DetailCharacterViewController: DetailCharacterViewInput {
    func updateView(model: DetailCharacterModel) {
        nameCharacterLabel.text = model.name
        descriptionLabel.text = model.description
        characterImageView.asyncImage = model.image
    }
}
