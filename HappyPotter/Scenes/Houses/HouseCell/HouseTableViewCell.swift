//
//  HouseTableViewCell.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HouseTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseHead: UILabel!

    // MARK: - Attributes
    static let identifier = "HouseTableViewCell"

    // MARK: - Functions
    func setup(with viewModel: HouseCellViewModelProtocol) {
        houseName.text = viewModel.getHouseName()
        houseHead.text = viewModel.getHouseHead()
    }
}
