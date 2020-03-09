//
//  HousesRoute.swift
//  HappyPotter
//
//  Created by Siqueira on 09/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

enum HousesRoute: NetworkRoute {
    case fetchHouses

    var configuration: RequestConfiguration {
        switch self {
        case .fetchHouses:
            // TODO: get values from plist
            var parameters = Dictionary<String, Any>()
            parameters["key"] = "$2a$10$4wdUeI4lDPjfwnheDRW8FuBp18oDJIjPCmzBotNrzCwfZG1t3JHp6"
            
            let config = RequestConfiguration(host: "www.potterapi.com",
                                       path: "/v1/houses",
                                       method: .get,
                                       encoding: .url,
                                       parameters: parameters)
            return config
        }
    }
}
