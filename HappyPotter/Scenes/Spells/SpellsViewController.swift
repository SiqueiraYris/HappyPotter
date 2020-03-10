//
//  SpellsViewController.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class SpellsViewController: UIViewController {
    // MARK: - Attributes
    private let viewModel: SpellsViewModelProtocol

    // MARK: - Initializer
    init(with viewModel: SpellsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: String(describing: SpellsViewController.self), bundle: .main)
//        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchSpells()
    }
}
