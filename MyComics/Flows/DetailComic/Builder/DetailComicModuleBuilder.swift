//
//  DetailComicModuleBuilder.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import UIKit

final class DetailComicModuleBuilder {
    static func build(comicsID: Int) -> UIViewController {
        let apiService = APIBuilder.shared.makeComicsAPI()
        let presenter = DetailComicPresenter(id: comicsID,
                                             comicsAPIService: apiService)
        let vc = DetailComicViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
