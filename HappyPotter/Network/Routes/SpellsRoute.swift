//
//  SpellsRoute.swift
//  HappyPotter
//
//  Created by Siqueira on 10/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

enum SpellsRoute: NetworkRoute {
    case fetchSpells

    var configuration: RequestConfiguration {
        switch self {
        case .fetchSpells:
            var parameters = Dictionary<String, Any>()
            parameters["key"] = apiKey

            let config = RequestConfiguration(host: serverHost,
                                       path: spellsPath,
                                       method: .get,
                                       encoding: .url,
                                       parameters: parameters)
            return config
        }
    }
}
