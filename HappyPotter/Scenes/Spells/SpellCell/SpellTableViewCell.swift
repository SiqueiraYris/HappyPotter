//
//  SpellTableViewCell.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class SpellTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var spellName: UILabel!
    @IBOutlet weak var spellType: UILabel!

    // MARK: - Attributes
    static let identifier = "SpellTableViewCell"

    // MARK: - Setup Cell
    func setup(with viewModel: SpellCellViewModelProtocol) {
        spellName.text = viewModel.getSpellName()
        spellType.text = viewModel.getSpellType()
    }
}
