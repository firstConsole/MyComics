//
//  ComicsContentView+DataSource.swift
//  MyComics
//
//  Created by Алексей Артамонов on 13.07.2023.
//

import UIKit

extension ComicsContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ComicsCollectionViewCell.identifier,
            for: indexPath) as? ComicsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(model: data)
        
        return cell
    }
}
