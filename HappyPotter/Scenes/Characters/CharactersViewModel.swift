//
//  CharactersViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - CharactersViewModelProtocol
protocol CharactersViewModelProtocol {
    var characterCells: Dynamic<[CharacterCellViewModelProtocol]> { get }

    func fetchCharacters()
    func getCharacterCellViewModel(row: Int) -> CharacterCellViewModelProtocol
    func numberOfRows() -> Int
}

final class CharactersViewModel: CharactersViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: CharactersCoordinator?
    private var service: CharactersServiceProtocol
    var characterCells: Dynamic<[CharacterCellViewModelProtocol]> = Dynamic([])

    // MARK: - Initializer
    init(coordinator: CharactersCoordinator? = nil, service: CharactersServiceProtocol = CharactersService()) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Functions
    func fetchCharacters() {
        let route = CharactersRoute.fetchCharacters

        service.fetchCharacters(route) { [weak self] (result: Result<[Character], ErrorHandler>) in
            guard let self = self else { return }

            switch result {
            case .success(let dataSource):
                let cellViewModel = dataSource.compactMap  {
                    CharacterCellViewModel(with: $0)
                }
                self.characterCells.value = cellViewModel

            case .failure(let error) :
                print("error \(error)")
            }
        }
    }

    func getCharacterCellViewModel(row: Int) -> CharacterCellViewModelProtocol {
        characterCells.value[row]
    }

    func numberOfRows() -> Int {
        characterCells.value.count
    }
}
