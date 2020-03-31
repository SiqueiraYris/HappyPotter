//
//  Spell.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Spell
struct Spell: Codable {
    // MARK: - Attributes
    let id, spell, type, effect: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case spell, type, effect
    }
}
