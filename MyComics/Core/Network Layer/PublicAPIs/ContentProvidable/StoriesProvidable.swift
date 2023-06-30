//
//  StoriesProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol StoriesProvidable {
    func getStories(by id: String, completion: @escaping ([StoryEntity]?) -> Void)
}
