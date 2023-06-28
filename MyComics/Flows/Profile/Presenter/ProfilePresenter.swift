//
//  ProfilePresenter.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import Foundation

final class ProfilePresenter {
    
    // MARK: - Properties
    
    weak var view: ProfileViewInput?

}

extension ProfilePresenter: ProfileViewOutput {
    func viewIsReady() {
        view?.showData()
    }
}
