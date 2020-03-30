//
//  HousesViewController.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HousesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var housesTableView: UITableView! {
        didSet {
            setupTableView()
        }
    }

    // MARK: - Attributes
    private let viewModel: HousesViewModelProtocol

    // MARK: - Initializer
    init(with viewModel: HousesViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: String(describing: HousesViewController.self), bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchHouses()

        setupUI()
        setupBinds()
    }

    // MARK: - Functions
    private func setupUI() {
        navigationItem.title = "Houses"
    }

    private func setupBinds() {
        viewModel.houseCells.bind { [weak self] _ in
            guard let self = self else { return }

            self.housesTableView.reloadData()
        }
    }

    private func setupTableView() {
        housesTableView.register(UINib(nibName: HouseTableViewCell.identifier, bundle: nil),
                                 forCellReuseIdentifier: HouseTableViewCell.identifier)

        housesTableView.dataSource = self
        housesTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension HousesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HouseTableViewCell.identifier,
                                                    for: indexPath) as? HouseTableViewCell {
            cell.selectionStyle = .none
            cell.setup(with: viewModel.getHouseCellViewModel(row: indexPath.row))
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension HousesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}
