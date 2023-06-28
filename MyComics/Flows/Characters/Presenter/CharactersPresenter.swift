//
//  CharactersPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class CharactersPresenter {
    
    // MARK: - Properties
    
    weak var view: CharactersViewInput?

}

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {
        view?.showData()
    }
}
