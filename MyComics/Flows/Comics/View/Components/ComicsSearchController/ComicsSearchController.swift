//
//  ComicsSearchController.swift
//  MyComics
//
//  Created by Алексей Артамонов on 25.07.2023.
//

import UIKit

final class ComicsSearchController: UISearchController {
    
    // MARK: - Properties
    
    var searchData: [ComicsCollectionViewCell.Model] = []
    let contentView = ComicsContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
    }
}

private extension ComicsSearchController {
    func setupSearchController() {
        searchResultsUpdater = self
        searchBar.delegate = self
    }
    
    func getData() {
        contentView.
    }
}
