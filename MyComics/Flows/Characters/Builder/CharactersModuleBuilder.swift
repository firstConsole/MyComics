//
//  CharactersModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersModuleBuilder {
    static func build(_ navigationController: UINavigationController?) -> UIViewController {
        let requestConfigurator = APIRequestConfigurator<CharacterEntity>(networkService: .init())
        let charactersAPI = CharactersAPIService(apiRequestConfigurator: requestConfigurator)
        let dataAdapter = CharactersDataAdapter(charactersAPI: charactersAPI)
        let coordinator = CharactersScreenCoordinator(navigationController: navigationController)
        let presenter = CharactersPresenter(
            coordinator: coordinator,
            dataAdapter: dataAdapter
        )
        let viewController = CharactersViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
