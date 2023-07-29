//
//  ComicsCoordinator.swift
//  MyComics
//
//  Created by Алексей Артамонов on 29.07.2023.
//

import UIKit

final class ComicsCoordinator: ComicsCoordinatorProtocol {
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func openDetailScreen(comicsID: Int) {
        let viewController = DetailComicModuleBuilder.build(comicsID: comicsID)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
