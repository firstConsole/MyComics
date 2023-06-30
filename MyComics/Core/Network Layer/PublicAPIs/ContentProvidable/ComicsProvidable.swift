//
//  ComicsProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol ComicsProvidable {
    func getComics(by id: String, completion: @escaping ([ComicEntity]?) -> Void)
}
