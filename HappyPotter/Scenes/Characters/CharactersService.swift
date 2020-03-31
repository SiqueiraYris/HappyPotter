//
//  CharactersService.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Typealias
typealias FetchCharactersResult = (Result<[Character], ErrorHandler>) -> Void

// MARK: - CharactersServiceProtocol
protocol CharactersServiceProtocol: AnyObject {
    func fetchCharacters(_ route: CharactersRoute, completion: @escaping FetchCharactersResult)
}

final class CharactersService {
    // MARK: - Attributes
    let networkManager: NetworkManagerProtocol

    // MARK: - Initializer
    init(networking: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networking
    }
}

// MARK: - CharactersServiceProtocol
extension CharactersService: CharactersServiceProtocol {
    func fetchCharacters(_ route: CharactersRoute, completion: @escaping FetchCharactersResult) {
        networkManager.requestObject(with: route.configuration, completion: completion)
    }
}
