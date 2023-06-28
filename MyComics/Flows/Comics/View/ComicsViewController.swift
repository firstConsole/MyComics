//
//  ComicsViewController.swift
//  MyComics
//
//  Created by Кирилл Копытин on 28.06.2023.
//

import UIKit

final class ComicsViewController: UIViewController {

    // MARK: - Properties
    
    private var presenter: ComicsViewOutput

    // MARK: - Init
    
    init(presenter: ComicsViewOutput) {
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

// MARK: - ComicsViewInput

extension ComicsViewController: ComicsViewInput {
    func showData() {
        print("Done")
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}
