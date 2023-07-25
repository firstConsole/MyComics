//
//  ComicsSearchController+UISearchResultsUpdater.swift
//  MyComics
//
//  Created by Алексей Артамонов on 25.07.2023.
//

import UIKit

extension ComicsSearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
    }
}
