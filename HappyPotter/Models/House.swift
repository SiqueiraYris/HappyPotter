//
//  House.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

struct House: Codable {

    // MARK: - Attributes
    let id, name, mascot, headOfHouse: String
    let houseGhost, founder: String
    let school: String?
    let members, values, colors: [String]

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, mascot, headOfHouse, houseGhost, founder
        case school, members, values, colors
    }

}
