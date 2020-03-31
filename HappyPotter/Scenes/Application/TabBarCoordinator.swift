//
//  TabBarCoordinator.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    // MARK: - Attributes
    private let tabBarController: UITabBarController
    private var housesCoordinator: HousesCoordinator
    private var charactersCoordinator: CharactersCoordinator
    private var spellsCoordinator: SpellsCoordinator
    private let window: UIWindow

    // MARK: - Initializer
    init(in window: UIWindow) {
        self.window = window

        tabBarController = UITabBarController()
        housesCoordinator = HousesCoordinator()
        charactersCoordinator = CharactersCoordinator()
        spellsCoordinator = SpellsCoordinator()
    }

    // MARK: - Life Cycle
    func start() {
        // TODO: change images/images selected
        let housesTabBarItem = UITabBarItem(title: String.localized(by: "Houses"), image: UIImage.remove, selectedImage: UIImage.remove)
        housesCoordinator.rootViewController.tabBarItem = housesTabBarItem
        housesCoordinator.start()

        let charactersTabBarItem = UITabBarItem(title: String.localized(by: "Characters"), image: UIImage.remove, selectedImage: UIImage.remove)
        charactersCoordinator.rootViewController.tabBarItem = charactersTabBarItem
        charactersCoordinator.start()

        let spellsTabBarItem = UITabBarItem(title: String.localized(by: "Spells"), image: UIImage.remove, selectedImage: UIImage.remove)
        spellsCoordinator.rootViewController.tabBarItem = spellsTabBarItem
        spellsCoordinator.start()
    
        tabBarController.setViewControllers([housesCoordinator.rootViewController,
                                             charactersCoordinator.rootViewController,
                                             spellsCoordinator.rootViewController],
                                            animated: true)
        window.rootViewController = tabBarController
    }
}
