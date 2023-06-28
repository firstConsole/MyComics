//
//  ComicsPresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class ComicsPresenter {
    
    // MARK: - Properties
    
    weak var view: ComicsViewInput?

}

extension ComicsPresenter: ComicsViewOutput {
    func viewIsReady() {
        view?.showData()
    }
}
