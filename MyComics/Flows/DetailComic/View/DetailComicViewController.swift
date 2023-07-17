//
//  DetailComicViewController.swift
//  MyComics
//
//  Created by Andrey Piskunov on 17.07.2023.
//

import UIKit

final class DetailComicViewController: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: DetailComicViewOutput
    
    // MARK: - Init
    
    init(presenter: DetailComicViewOutput) {
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

// MARK: - DetailComicViewInput

extension DetailComicViewController: DetailComicViewInput {
    func updateView() {
    }
}
