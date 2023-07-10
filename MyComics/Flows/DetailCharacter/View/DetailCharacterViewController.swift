//
//  CharacterDetailView.swift
//  MyComics
//
//  Created by Andrey Piskunov on 10.07.2023.
//

import UIKit

final class DetailCharacterViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presenter: DetailCharacterViewOutput
    
    // MARK: - Init
    
    init(presenter: DetailCharacterViewOutput) {
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

extension DetailCharacterViewController: DetailCharacterViewInput {
    func showData() {
        print("Done")
    }
    
    func showAlert(with message: String) {
        showError(message: message)
    }
}
