//
//  DefaultAPIService.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

class DefaultAPIService<T: EntityPresentable> {
    
    // MARK: - Public Properties
    
    var initialPath: Path {
        fatalError("Should be overriden")
    }
    
    // MARK: - Dependencies
    
    private let apiRequestConfigurator: APIRequestConfigurator<T>
    
    // MARK: - Init
    
    init(apiRequestConfigurator: APIRequestConfigurator<T>) {
        self.apiRequestConfigurator = apiRequestConfigurator
    }
    
    // MARK: - Public Methods
    
    func makeAllContentRequest(completion: @escaping ([T]?) -> Void) {
        apiRequestConfigurator.requestEntities(path: initialPath, completion: completion)
    }
    
    func makeContentRequest(by id: String, completion: @escaping (T?) -> Void) {
        apiRequestConfigurator.requestEntities(path: initialPath, id: id) { entities in
            completion(entities?.first)
        }
    }
    
    func makeConcreteContentRequest<U: EntityPresentable>(
        by id: String,
        additionalPath: Path,
        completion: @escaping ([U]?) -> Void
    ) {
        apiRequestConfigurator.requestEntities(
            path: initialPath,
            id: id,
            additionalPath: additionalPath,
            completion: completion
        )
    }
}
