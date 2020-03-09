//
//  HousesService.swift
//  HappyPotter
//
//  Created by Siqueira on 09/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

typealias FetchHousesResult = (Result<[House], ErrorHandler>) -> Void

protocol HousesServiceProtocol: AnyObject {
    func fetchHouses(_ route: HousesRoute, completion: @escaping FetchHousesResult)
}

final class HousesService {
    // MARK: - Attributes
    let networkManager: NetworkManagerProtocol

    // MARK: - Initializer
    init(networking: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networking
    }
}

// MARK: - HousesServiceProtocol
extension HousesService: HousesServiceProtocol {
    func fetchHouses(_ route: HousesRoute, completion: @escaping FetchHousesResult) {
        networkManager.requestObject(with: route.configuration, completion: completion)
    }
}
