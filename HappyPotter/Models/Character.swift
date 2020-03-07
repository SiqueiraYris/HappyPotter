//
//  Character.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

struct Character: Decodable {

    // MARK: - Attributes
    let id, name, role, house: String
    let school: String
    let ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater: Bool
    let bloodStatus, species: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, role, house, school
        case ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater, bloodStatus, species
    }

}
