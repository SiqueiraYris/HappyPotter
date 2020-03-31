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
            var parameters = Dictionary<String, Any>()
            parameters["key"] = apiKey

            let config = RequestConfiguration(host: serverHost,
                                       path: housesPath,
                                       method: .get,
                                       encoding: .url,
                                       parameters: parameters)
            return config
        }
    }
}
