//
//  SpellsViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol SpellsViewModelProtocol {
    var spellCells: Dynamic<[SpellCellViewModelProtocol]> { get }

    func fetchSpells()
    func getSpellCellViewModel(row: Int) -> SpellCellViewModelProtocol
    func numberOfRows() -> Int
}

final class SpellsViewModel: SpellsViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: SpellsCoordinator?
    private var service: SpellsServiceProtocol
    var spellCells: Dynamic<[SpellCellViewModelProtocol]> = Dynamic([])

    // MARK: - Initializer
    init(coordinator: SpellsCoordinator? = nil, service: SpellsService = SpellsService()) {
        self.coordinator = coordinator
        self.service = service
    }

    func fetchSpells() {
        let route = SpellsRoute.fetchSpells
        
        service.fetchSpells(route) { [weak self] (result: Result<[Spell], ErrorHandler>) in
            guard let self = self else { return }

            switch result {
            case .success(let dataSource):
                print("dataSource spells \(dataSource)")
                
                let cellViewModel = dataSource.compactMap {
                    SpellCellViewModel(spell: $0)
                }
                self.spellCells.value = cellViewModel
            case .failure(let error) :
                print("error \(error)")
            }
        }
    }

    func getSpellCellViewModel(row: Int) -> SpellCellViewModelProtocol {
        spellCells.value[row]
    }

    func numberOfRows() -> Int {
        spellCells.value.count
    }
}
