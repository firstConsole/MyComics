//
//  CharactersProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol CharactersProvidable {
    func getCharacters(by id: String, completion: @escaping ([CharacterEntity]?) -> Void)
}
