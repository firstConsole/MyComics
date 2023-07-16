//
//  ComicsContentView.swift
//  MyComics
//
//  Created by Алексей Артамонов on 13.07.2023.
//

import UIKit

final class ComicsContentView: UICollectionView {
    
    // MARK: - init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero,
                   collectionViewLayout: Self.makeFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ComicsContentView {
    static func makeFlowLayout() -> UICollectionViewFlowLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        
        return collectionViewLayout
    }
    
    func update(models: [ComicsContentView.Model]) {
        let _: [ComicsCollectionViewCell.Model] = models.map {
            .init(title: $0.title,
                  author: $0.author,
                  image: $0.image)
        }
    }
}
