//
//  CharactersCoordinator.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class CharactersCoordinator: Coordinator {
    // MARK: - Attributes
    var rootViewController: UINavigationController

    // MARK: - Initializer
    init() {
        rootViewController = UINavigationController()
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = CharactersViewModel(coordinator: self)
        let viewController = CharactersViewController(with: viewModel)
        rootViewController.pushViewController(viewController, animated: true)
    }
}
