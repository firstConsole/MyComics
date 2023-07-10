//
//  CharacterDetailView.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presenter: DetailCharacterViewOutput
    
    private lazy var image = UIImage(named: "characterImage")
    private lazy var characterImageView = UIImageView(image: image)
    
    private lazy var nameCharacterLabel: UILabel = {
        let nameCharacterLabel = UILabel()
        nameCharacterLabel.text = "Name"
        nameCharacterLabel.textColor = .white
        nameCharacterLabel.textAlignment = .center
        return nameCharacterLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Герой американских комиксов Marvel Comics, обладающий сверхспособностями: силой, ловкостью, легкость"
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 10
        return descriptionLabel
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
        view.backgroundColor = .commonBackground
        view.addSubview(descriptionLabel)
        view.addSubview(nameCharacterLabel)
        view.addSubview(characterImageView)
        setupConstraints()
        setupImageView()
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
            nameCharacterLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
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
    
    private func setupImageView() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFit
    }
}

extension DetailCharacterViewController: DetailCharacterViewInput {
    func showData() {
        print("Done")
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}
