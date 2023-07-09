//
//  CharactersDataAdapter.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

final class CharactersDataAdapter: CharactersDataAdapterProtocol {
    
    // MARK: - Private Properties
    
    private var models: [CharacterPresentableModel] = []
    
    // MARK: - Dependencies
    
    private let charactersAPI: any CharactersAPI
    
    // MARK: - Init
    
    init(charactersAPI: some CharactersAPI) {
        self.charactersAPI = charactersAPI
    }
    
    // MARK: - Public Methods
    
    func getData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.getAllContent { [weak self] rowData in
            guard let rowData, let self else {
                completion([])
                return
            }
            let models = self.setupModels(rowData: rowData)
            completion(models)
        }
    }
    
    func getNextPageData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.loadNextPage { [weak self] rowData in
            guard let rowData, let self else {
                completion(self?.models ?? [])
                return
            }
            let models = self.setupModels(rowData: rowData)
            completion(models)
        }
    }
}

// MARK: - Private Methods

private extension CharactersDataAdapter {
    func setupModels(rowData: [CharacterEntity]) -> [CharacterPresentableModel] {
        let configuredModels: [CharacterPresentableModel] = rowData.compactMap { data in
            return CharacterPresentableModel(
                title: data.name ?? "",
                image: .init(
                    imageURL: data.thumbnail?.path,
                    imageExtension: data.thumbnail?.extension
                )
            )
        }
        
        models.append(contentsOf: configuredModels)
        return models
    }
}
