//
//  ComicsDataAdapterProtocol.swift
//  MyComics
//
//  Created by Алексей Артамонов on 16.07.2023.
//

import Foundation

protocol ComicsDataAdapterProtocol {
    func getData(completion: @escaping ([ComicsPresentableModel]) -> Void)
    func getComicsID(by indexPath: IndexPath, isSearching: Bool) -> Int?
}
