//
//  ProfileModuleBuilder.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ProfileModuleBuilder {
    
    static func build() -> UIViewController {
        let presenter = ProfilePresenter()
        let vc = ProfileViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
