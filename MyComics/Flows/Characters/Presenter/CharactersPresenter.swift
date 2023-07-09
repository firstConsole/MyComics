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

// MARK: - CharactersViewOutput -

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            let models: [CharactersContentView.Model] = models.map {
                .init(title: $0.title, image: $0.image)
            }
            
            DispatchQueue.main.async {
                self?.view?.update(models: models)
            }
        }
    }
    
    func loadNextPage() {
    }
}
