//
//  RootCoordinator.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class RootCoordinator {
    
    private weak var window: UIWindow?
    
    func start(in window: UIWindow) {
        let charactersVC = UINavigationController(rootViewController: CharactersModuleBuilder.build())
        charactersVC.tabBarItem.image = UIImage(systemName: "bubble.left.and.bubble.right")
        charactersVC.tabBarItem.title = LocalizationKeys.charactersTabItem.rawValue.localized
        
        let comicsVC = UINavigationController(rootViewController: ComicsModuleBuilder.build())
        comicsVC.tabBarItem.image = UIImage(systemName: "person.circle")
        comicsVC.tabBarItem.title = LocalizationKeys.comicsTabItem.rawValue.localized
        
        let profileVC = UINavigationController(rootViewController: ProfileModuleBuilder.build())
        profileVC.tabBarItem.image = UIImage(systemName: "gear")
        profileVC.tabBarItem.title = LocalizationKeys.profileTabItem.rawValue.localized
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [charactersVC, comicsVC, profileVC]
        
        window.makeKeyAndVisible()
        window.rootViewController = tabBarVC
        self.window = window
    }
}
