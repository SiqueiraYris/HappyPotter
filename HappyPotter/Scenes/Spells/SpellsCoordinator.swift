//
//  SpellsCoordinator.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class SpellsCoordinator: Coordinator {

    // MARK: - Attributes
    var rootViewController: UINavigationController

    // MARK: - Life Cycle
    init() {
        rootViewController = UINavigationController()
    }

    func start() {
        // TODO: start with view model
        let viewController = SpellsViewController()
        rootViewController.pushViewController(viewController, animated: true)
    }

}
