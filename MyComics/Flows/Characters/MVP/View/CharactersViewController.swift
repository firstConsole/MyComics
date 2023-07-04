//
//  CharactersViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = CharactersContentView()
    private let presenter: CharactersViewOutput

    // MARK: - Init
    
    init(presenter: CharactersViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .commonBackground
        navigationItem.title = LocalizationKeys.localized(.charactersTabItem)
        presenter.viewIsReady()
    }
}

// MARK: - CharactersViewInput

extension CharactersViewController: CharactersViewInput {
    func update(models: [CharactersContentView.Model]) {
        contentView.update(models: models)
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}
