//
//  HouseCellViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - HouseCellViewModelProtocol
protocol HouseCellViewModelProtocol {
    func getHouseName() -> String
    func getHouseHead() -> String
}

final class HouseCellViewModel: HouseCellViewModelProtocol {
    // MARK: - Attributes
    let house: House

    // MARK: - Initializer
    init(with house: House) {
        self.house = house
    }

    // MARK: - Functions
    func getHouseName() -> String {
        house.name
    }

    func getHouseHead() -> String {
        "Head: \(house.headOfHouse)"
    }
}
