//
//  HousesCoordinator.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HousesCoordinator: Coordinator {

    // MARK: - Attributes
    var rootViewController: UINavigationController

    // MARK: - Life Cycle
    init() {
        rootViewController = UINavigationController()
    }

    func start() {
        let viewController = HousesViewController()
        rootViewController.pushViewController(viewController, animated: true)
//        let viewModel = MoviesViewModel(coordinator: self)
//        let viewController = MoviesViewController(viewModel: viewModel)
//        navigationController?.pushViewController(viewController, animated: true)
    }

}
    
