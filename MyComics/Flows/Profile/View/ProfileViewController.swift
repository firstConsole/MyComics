//
//  ProfileViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Properties
    
    private var presenter: ProfileViewOutput

    // MARK: - Init
    
    init(presenter: ProfileViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {
    func showData() {
        print("Done")
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}
