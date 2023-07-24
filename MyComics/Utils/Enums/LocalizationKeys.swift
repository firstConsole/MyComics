//
//  LocalizationKeys.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

enum LocalizationKeys: String {
    case charactersTabItem
    case comicsTabItem
    case profileTabItem
    case errorAlertTitle
    case alertCancelAction
    case detailButtonTitle
    
    static func localized(_ type: Self) -> String {
        return type.rawValue.localized
    }
}
