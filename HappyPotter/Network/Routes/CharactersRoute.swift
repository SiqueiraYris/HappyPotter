//
//  CharactersRoute.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

enum CharactersRoute: NetworkRoute {
    case fetchCharacters

    var configuration: RequestConfiguration {
        switch self {
        case .fetchCharacters:
            var parameters = Dictionary<String, Any>()
            parameters["key"] = apiKey

            let config = RequestConfiguration(host: serverHost,
                                       path: charactersPath,
                                       method: .get,
                                       encoding: .url,
                                       parameters: parameters)
            return config
        }
    }
}
