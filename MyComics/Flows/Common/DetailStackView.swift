//
//  DetailStackView.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import UIKit

final class DetailStackView: UIStackView {

    // MARK: - Private Properties
    
    private let addButton = UIButton()
    private let detailButton = UIButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available (*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension DetailStackView {
    func setupUI() {
        axis = .horizontal
        distribution = .fill
        spacing = 9
        addSubviews()
        setupAddButton()
        setupDetailButton()
    }
    
    func addSubviews() {
        addArrangedSubview(addButton)
        addArrangedSubview(detailButton)
    }
    
    func setupConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }
    
    func setupAddButton() {
        addButton.layer.cornerRadius = 10
        addButton.setImage(.addButton, for: .normal)
        addButton.backgroundColor = .buttonBackground
        addButton.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    func setupDetailButton() {
        detailButton.layer.cornerRadius = 10
        detailButton.backgroundColor = .buttonBackground
        detailButton.setContentHuggingPriority(.defaultLow, for: .horizontal)
        detailButton.titleLabel?.font = .systemFont(ofSize: 14)
        detailButton.setTitleColor(.black, for: .normal)
        detailButton.setTitle(LocalizationKeys.localized(.detailButtonTitle), for: .normal)
    }
}
