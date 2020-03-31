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
            // TODO: get values from plist
            var parameters = Dictionary<String, Any>()
            parameters["key"] = "$2a$10$4wdUeI4lDPjfwnheDRW8FuBp18oDJIjPCmzBotNrzCwfZG1t3JHp6"
            
            let config = RequestConfiguration(host: "www.potterapi.com",
                                       path: "/v1/characters",
                                       method: .get,
                                       encoding: .url,
                                       parameters: parameters)
            return config
        }
    }
}
