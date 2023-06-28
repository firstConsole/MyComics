//
//  UIViewController+Extension.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

extension UIViewController {
    
    func showError(title: String = LocalizationKeys.errorAlertTitle.rawValue.localized, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: LocalizationKeys.alertCancelAction.rawValue.localized, style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
