//
//  CharacterTableViewCell.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var characterName: UILabel!
    @IBOutlet private weak var characterRole: UILabel!
    @IBOutlet private weak var characterHouse: UILabel!

    // MARK: - Attributes
    static let identifier = "CharacterTableViewCell"

    // MARK: - Functions
    func setup(with viewModel: CharacterCellViewModelProtocol) {
        characterName.text = viewModel.getCharacterName()
        characterRole.text = viewModel.getCharacterRole()
        characterHouse.text = viewModel.getCharacterHouse()
    }
}
