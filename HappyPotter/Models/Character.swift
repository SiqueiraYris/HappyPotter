//
//  Character.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Character
struct Character: Decodable {
    // MARK: - Attributes
    let id, name: String
    let role, house, school: String?
    let ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater: Bool
    let bloodStatus, species: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, role, house, school
        case ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater, bloodStatus, species
    }
}
