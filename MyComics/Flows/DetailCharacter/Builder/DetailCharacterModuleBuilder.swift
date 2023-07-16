//
//  ChsracterDetailModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterModuleBuilder {
    
    static func build(characterID: Int) -> UIViewController {
        let requestConfigurator = APIRequestConfigurator<CharacterEntity>(networkService: .init())
        let charactersAPIService = CharactersAPIService(apiRequestConfigurator: requestConfigurator)
        let presenter = DetailCharacterPresenter(id: characterID,
                                                 characterAPIService: charactersAPIService)
        let vc = DetailCharacterViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
