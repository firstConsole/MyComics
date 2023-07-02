//
//  UIImage + Extensions.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

extension UIImage {
    static let addButton: UIImage? = checkedImage(name: "add_button")
    
    private static func checkedImage(name: String) -> UIImage? {
        guard let image = UIImage(named: name) else {
            assertionFailure("Image name chaneged or image has been deleted")
            return nil
        }
        return image
    }
}
