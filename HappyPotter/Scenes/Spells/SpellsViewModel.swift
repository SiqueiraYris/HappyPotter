//
//  SpellsViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol SpellsViewModelProtocol {
    var spells: [Spell] { get }

    func fetchSpells()
}

final class SpellsViewModel: SpellsViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: SpellsCoordinator?
    private var service: SpellsServiceProtocol
    var spells: [Spell] = []

    // MARK: - Initializer
    init(coordinator: SpellsCoordinator? = nil, service: SpellsService = SpellsService()) {
        self.coordinator = coordinator
        self.service = service
    }

    func fetchSpells() {
        let route = SpellsRoute.fetchSpells
        
        service.fetchSpells(route) { [weak self] (result: Result<[Spell], ErrorHandler>) in
            switch result {
            case .success(let dataSource):
                print("dataSource spells \(dataSource)")
            case .failure(let error) :
                print("error \(error)")
            }
        }
    }
}
