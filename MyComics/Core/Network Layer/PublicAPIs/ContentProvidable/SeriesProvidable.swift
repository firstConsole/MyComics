//
//  SeriesProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol SeriesProvidable {
    func getSeries(by id: String, completion: @escaping ([SeriesEntity]?) -> Void)
}
