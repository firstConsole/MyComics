//
//  ProfileViewInput.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

protocol ProfileViewInput: AnyObject {
    func showData()
    func showAlert(with message: String)
}
