//
//  SpellCellViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 10/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - SpellCellViewModelProtocol
protocol SpellCellViewModelProtocol {
    func getSpellName() -> String
    func getSpellType() -> String
}

final class SpellCellViewModel: SpellCellViewModelProtocol {
    // MARK: - Attributes
    private var spell: Spell

    // MARK: - Initializer
    init(spell: Spell) {
        self.spell = spell
    }

    // MARK: - Functions
    func getSpellName() -> String {
        spell.spell
    }

    func getSpellType() -> String {
        "Type: \(spell.type)"
    }
}
