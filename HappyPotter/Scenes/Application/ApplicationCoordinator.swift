//
//  ApplicationCoordinator.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {

    // MARK: - Attributes
    private static var window: UIWindow? = {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        return sceneDelegate?.window
    }()

    // MARK: - Life Cycle
    static func start() {
        startTabBar()
    }

    private static func startTabBar() {
        guard let window = window else { return }
        let tabBarCoordinator = TabBarCoordinator(in: window)
        tabBarCoordinator.start()
    }

}
