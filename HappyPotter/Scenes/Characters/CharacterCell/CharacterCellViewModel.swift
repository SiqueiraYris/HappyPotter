//
//  CharacterCellViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - CharacterCellViewModelProtocol
protocol CharacterCellViewModelProtocol {
    func getCharacterName() -> String
    func getCharacterRole() -> String
    func getCharacterHouse() -> String
}

final class CharacterCellViewModel: CharacterCellViewModelProtocol {
    // MARK: - Attributes
    let character: Character

    // MARK: - Initializer
    init(with character: Character) {
        self.character = character
    }

    // MARK: - Functions
    func getCharacterName() -> String {
        character.name
    }

    func getCharacterRole() -> String {
        if let role = character.role {
            return String.localizedComplement(by: "CharacterRole", with: role)
        }
        return String.localizedComplement(by: "CharacterRole", with: String.localized(by: "None"))
    }

    func getCharacterHouse() -> String {
        if let house = character.house {
            return String.localizedComplement(by: "CharacterHouse", with: house)
        }
        return String.localizedComplement(by: "CharacterHouse", with: String.localized(by: "None"))
    }
}
