//
//  ChsracterDetailModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterModuleBuilder {
    
    static func build() -> UIViewController {
        let presenter = DetailCharacterPresenter()
        let vc = DetailCharacterViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
