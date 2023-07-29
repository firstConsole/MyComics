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
    private let id: Int
    
    // MARK: - Dependency
    
    private let comicsAPIService: any ComicsAPI
    
    // MARK: - Init
    
    init(id: Int, comicsAPIService: any ComicsAPI) {
        self.id = id
        self.comicsAPIService = comicsAPIService
    }
    
    // MARK: - Private methods
    
    private func loadComics() {
        comicsAPIService.getContent(by: id) { [weak self] comics in
            guard let self = self else {
                return
            }
            
            let model = DetailComicModel(
                id: comics?.id,
                title: comics?.title,
                description: comics?.description,
                image: AsyncImage(
                    imageURL: comics?.thumbnail?.path,
                    imageExtension: comics?.thumbnail?.extension
                )
            )
            
            DispatchQueue.main.async {
                self.view?.updateView(model: model)
            }
        }
    }
}

// MARK: - DetailComicViewOutput

extension DetailComicPresenter: DetailComicViewOutput {
    func viewIsReady() {
        loadComics()
    }
}
