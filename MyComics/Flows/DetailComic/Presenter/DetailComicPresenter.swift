//
//  DetailComicPresenter.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import Foundation

final class DetailComicPresenter {
    
    // MARK: - Properties
    
    weak var view: DetailComicViewInput?
    
}

// MARK: - DetailComicViewOutput

extension DetailComicPresenter: DetailComicViewOutput {
    func viewIsReady() {
        view?.updateView()
    }
}
