//
//  CharactersDataAdapter.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

final class CharactersDataAdapter: CharactersDataAdapterProtocol {
    
    // MARK: - Private Properties
    
    private var entities: [CharacterEntity] = []
    private var models: [CharacterPresentableModel] = []
    
    // MARK: - Dependencies
    
    private let charactersAPI: any CharactersAPI
    
    // MARK: - Init
    
    init(charactersAPI: some CharactersAPI) {
        self.charactersAPI = charactersAPI
    }
    
    // MARK: - Public Methods
    
    func getData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.getAllContent { [weak self] rawData in
            self?.processLoadedContent(rawData: rawData, completion: completion)
        }
    }
    
    func getNextPageData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.loadNextPage { [weak self] rawData in
            self?.processLoadedContent(rawData: rawData, completion: completion)
        }
    }
}

// MARK: - Private Methods

private extension CharactersDataAdapter {
    func processLoadedContent(
        rawData: [CharacterEntity]?,
        completion: @escaping ([CharacterPresentableModel]) -> Void
    ) {
        guard let rawData else {
            completion(models)
            return
        }
        let models = setupModels(rawData: rawData)
        completion(models)
    }
    
    func setupModels(rawData: [CharacterEntity]) -> [CharacterPresentableModel] {
        let configuredModels: [CharacterPresentableModel] = rawData.compactMap { data in
            return CharacterPresentableModel(
                title: data.name ?? "",
                image: .init(
                    imageURL: data.thumbnail?.path,
                    imageExtension: data.thumbnail?.extension
                )
            )
        }
        
        entities.append(contentsOf: rawData)
        models.append(contentsOf: configuredModels)
        return models
    }
}
