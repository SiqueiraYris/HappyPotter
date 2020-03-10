//
//  SpellCellViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 10/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol SpellCellViewModelProtocol {
    var spell: Spell { get }
}

final class SpellCellViewModel: SpellCellViewModelProtocol {
    // MARK: - Attributes
    var spell: Spell

    // MARK: - Initializer
    init(spell: Spell) {
        self.spell = spell
    }
}
