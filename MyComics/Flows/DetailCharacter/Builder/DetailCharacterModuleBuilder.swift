//
//  ChsracterDetailModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterModuleBuilder {
    
    static func build(characterID: Int) -> UIViewController {
        let apiService = APIBuilder.shared.makeCharactersAPI()
        let presenter = DetailCharacterPresenter(id: characterID,
                                                 characterAPIService: apiService)
        let vc = DetailCharacterViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
