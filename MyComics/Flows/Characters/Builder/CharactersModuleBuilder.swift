//
//  CharactersModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class CharactersModuleBuilder {
    
    static func build() -> UIViewController {
        let presenter = CharactersPresenter()
        let vc = CharactersViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
