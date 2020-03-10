//
//  SpellsService.swift
//  HappyPotter
//
//  Created by Siqueira on 10/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

typealias FetchSpellsResult = (Result<[Spell], ErrorHandler>) -> Void

protocol SpellsServiceProtocol: AnyObject {
    func fetchSpells(_ route: SpellsRoute, completion: @escaping FetchSpellsResult)
}

final class SpellsService {
    // MARK: - Attributes
    let networkManager: NetworkManagerProtocol

    // MARK: - Initializer
    init(networking: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networking
    }
}

// MARK: - SpellsServiceProtocol
extension SpellsService: SpellsServiceProtocol {
    func fetchSpells(_ route: SpellsRoute, completion: @escaping FetchSpellsResult) {
        networkManager.requestObject(with: route.configuration, completion: completion)
    }
}
