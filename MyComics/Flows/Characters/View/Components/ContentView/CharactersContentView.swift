//
//  CharactersContentView.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

final class CharactersContentView: UICollectionView {
    
    private enum Section {
        case main
    }
    
    private typealias DataSourceType = UICollectionViewDiffableDataSource<Section, CharactersCollectionViewCell.Model>
    
    // MARK: - Private Properties
    
    private lazy var diffableDataSource: DataSourceType = makeDiffableDataSource()
    
    // MARK: - Init

    init() {
        super.init(frame: .zero, collectionViewLayout: Self.makeLayout())
        setupUI()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func update(models: [CharactersContentView.Model]) {
        let models: [CharactersCollectionViewCell.Model] = models.map {
            .init(title: $0.title, image: .init($0.image))
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, CharactersCollectionViewCell.Model>()
        snapshot.appendSections([.main])
        snapshot.appendItems(models, toSection: .main)
        diffableDataSource.apply(snapshot, animatingDifferences: false)
        invalidateIntrinsicContentSize()
    }
}

// MARK: - Private Methods

private extension CharactersContentView {
    func setupUI() {
        backgroundColor = .commonBackground
        register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
    }

    private func makeDiffableDataSource() -> DataSourceType {
        let diffableDataSource = DataSourceType(collectionView: self) { collectionView, indexPath, model in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CharactersCollectionViewCell.identifier,
                for: indexPath
            ) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure(model)
            cell.sizeToFit()
            
            return cell
        }
        
        return diffableDataSource
    }
    
    static func makeLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(162.roundedScale()),
            heightDimension: .absolute(237.roundedScale())
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: itemSize.heightDimension
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(31)
        group.contentInsets = .init(top: 0, leading: 19, bottom: 0, trailing: 19)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 19
        section.contentInsets = .init(top: 19, leading: 0, bottom: 19, trailing: 0)

        // Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
