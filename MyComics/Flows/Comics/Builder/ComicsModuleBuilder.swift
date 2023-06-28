//
//  ComicsModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ComicsModuleBuilder {
    
    static func build() -> UIViewController {
        let presenter = ComicsPresenter()
        let vc = ComicsViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
