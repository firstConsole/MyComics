//
//  CharactersModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersModuleBuilder {
    
    static func build() -> UIViewController {
        let requestConfigurator = APIRequestConfigurator<CharacterEntity>(networkService: .init())
        let charactersAPI = CharactersAPIService(apiRequestConfigurator: requestConfigurator)
        let dataAdapter = CharactersDataAdapter(charactersAPI: charactersAPI)
        let presenter = CharactersPresenter(dataAdapter: dataAdapter)
        let viewController = CharactersViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
