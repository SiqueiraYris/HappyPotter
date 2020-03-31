//
//  SpellsViewController.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class SpellsViewController: UIViewController {
    @IBOutlet private weak var spellsTableView: UITableView! {
        didSet {
            setupTableView()
        }
    }
    // MARK: - Attributes
    private let viewModel: SpellsViewModelProtocol

    // MARK: - Initializer
    init(with viewModel: SpellsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: String(describing: SpellsViewController.self), bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchSpells()

        setupUI()
        setupBinds()
    }

    // MARK: - Functions
    private func setupUI() {
        navigationItem.title = String.localized(by: "Spells")
    }

    private func setupBinds() {
        viewModel.spellCells.bind { [weak self] _ in
            guard let self = self else { return }

            self.spellsTableView.reloadData()
        }
    }

    private func setupTableView() {
        spellsTableView.register(UINib(nibName: SpellTableViewCell.identifier, bundle: nil),
        forCellReuseIdentifier: SpellTableViewCell.identifier)

        spellsTableView.dataSource = self
        spellsTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension SpellsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpellTableViewCell.identifier,
                                                       for: indexPath) as? SpellTableViewCell else {
                                                        fatalError()
        }
        cell.selectionStyle = .none
        cell.setup(with: viewModel.getSpellCellViewModel(row: indexPath.row))

        return cell
    }
}

// MARK: - UITableViewDelegate
extension SpellsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}
