//
//  HousesViewModel.swift
//  HappyPotter
//
//  Created by Siqueira on 06/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol HousesViewModelProtocol {
    var houses: [House] { get }
    var houseCells: Dynamic<[HouseCellViewModelProtocol]> { get }

    func fetchHouses()
    func getHouseCellViewModel(row: Int) -> HouseCellViewModelProtocol
    func numberOfRows() -> Int
}

final class HousesViewModel: HousesViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: HousesCoordinator?
    private var service: HousesServiceProtocol
    var houses: [House] = []
    var houseCells: Dynamic<[HouseCellViewModelProtocol]> = Dynamic([])

    // MARK: - Initializer
    init(coordinator: HousesCoordinator? = nil, service: HousesService = HousesService()) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Functions
    func fetchHouses() {
        let route = HousesRoute.fetchHouses

        service.fetchHouses(route) { [weak self] (result: Result<[House], ErrorHandler>) in
            guard let self = self else { return }

            switch result {
            case .success(let dataSource):
                let cellViewModel = dataSource.compactMap {
                    HouseCellViewModel(with: $0)
                }
                self.houseCells.value = cellViewModel
                print("dataSource \(dataSource)")

            case .failure(let error) :
                print("error \(error)")
            }
        }
    }

    func getHouseCellViewModel(row: Int) -> HouseCellViewModelProtocol {
        houseCells.value[row]
    }

    func numberOfRows() -> Int {
        houseCells.value.count
    }
}
