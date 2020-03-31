//
//  CharactersViewController.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController {
    @IBOutlet private weak var charactersTableView: UITableView! {
        didSet {
            setupTableView()
        }
    }

    // MARK: - Attributes
    private let viewModel: CharactersViewModelProtocol

    // MARK: - Initializer
    init(with viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: String(describing: CharactersViewController.self), bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchCharacters()

        setupUI()
        setupBinds()
    }

    // MARK: - Functions
    private func setupUI() {
        navigationItem.title = String.localized(by: "Characters")
    }

    private func setupBinds() {
        viewModel.characterCells.bind { [weak self] _ in
            guard let self = self else { return }

            self.charactersTableView.reloadData()
        }
    }

    private func setupTableView() {
        charactersTableView.register(UINib(nibName: CharacterTableViewCell.identifier, bundle: nil),
                                 forCellReuseIdentifier: CharacterTableViewCell.identifier)

        charactersTableView.dataSource = self
        charactersTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier,
                                                    for: indexPath) as? CharacterTableViewCell {
            cell.selectionStyle = .none
            cell.setup(with: viewModel.getCharacterCellViewModel(row: indexPath.row))
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}

