//
//  CharactersDataAdapter.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation

final class CharactersDataAdapter: CharactersDataAdapterProtocol {
    
    // MARK: - Private Properties
    
    private let charactersAPI: any CharactersAPI
    
    init(charactersAPI: some CharactersAPI) {
        self.charactersAPI = charactersAPI
    }
    
    func getData(completion: @escaping ([CharacterPresentableModel]) -> Void) {
        charactersAPI.getAllContent { rowData in
            guard let rowData else { return }
            let models: [CharacterPresentableModel] = rowData.compactMap { data in
                return CharacterPresentableModel(
                    title: data.name ?? "",
                    image: .init(
                        imageURL: data.thumbnail?.path,
                        imageExtension: data.thumbnail?.extension
                    )
                )
            }
            completion(models)
        }
    }
}
