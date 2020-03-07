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

    // MARK: - Life Cycle
    init() {
        rootViewController = UINavigationController()
    }

    func start() {
        let viewController = CharactersViewController()
        rootViewController.pushViewController(viewController, animated: true)
    }

}
