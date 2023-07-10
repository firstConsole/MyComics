//
//  CharactersPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class CharactersPresenter {
    
    // MARK: - Properties
    
    weak var view: CharactersViewInput?
    
    // MARK: - Dependencies
    
    private let dataAdapter: CharactersDataAdapterProtocol
    
    // MARK: - Init
    
    init(dataAdapter: CharactersDataAdapterProtocol) {
        self.dataAdapter = dataAdapter
    }
}

// MARK: - Private Methods -

private extension CharactersPresenter {
    func updateView(with models: [CharacterPresentableModel]) {
        let models: [CharactersContentView.Model] = models.map {
            .init(title: $0.title, image: $0.image)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.update(models: models)
        }
    }
}

// MARK: - CharactersViewOutput -

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            self?.updateView(with: models)
        }
    }
    
    func loadNextPage() {
        dataAdapter.getNextPageData { [weak self] models in
            self?.updateView(with: models)
        }
    }
}
