//
//  CharacterDetailPresenter.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import Foundation

final class DetailCharacterPresenter {
    
    // MARK: - Properties
    
    weak var view: DetailCharacterViewInput?
}

extension DetailCharacterPresenter: DetailCharacterViewOutput {
    func viewIsReady() {
        view?.showData()
    }
}
