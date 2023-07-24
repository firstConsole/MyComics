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
    
    // MARK: - Dependencies
    
    let dataAdapter: ComicsDataAdapter
    
    // MARK: - Init
    
    init(dataAdapter: ComicsDataAdapter) {
        self.dataAdapter = dataAdapter
    }
}

// MARK: - Private Methods -

private extension ComicsPresenter {
    func updateView(with models: [ComicsPresentableModel]) {
        let models: [ComicsContentView.Model] = models.map {
            .init(title: $0.title,
                  author: $0.author,
                  image: $0.image)
        }
        
        print("(ComicsPresenter): Items updated complete = \(models.count)")
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            if models.isEmpty {
                self.view?.showAlert(with: "No comics data loaded")
            } else {
                self.view?.update(models: models)
            }
        }
    }
}

// MARK: - ComicsViewOutput

extension ComicsPresenter: ComicsViewOutput {
    func viewIsReady() {
        dataAdapter.getData { [weak self] models in
            guard let self = self else {
                return
            }
            
            print("(ComicsPresenter): Items updated complete with \(models.count) items")
            
            self.updateView(with: models)
        }
    }
}
