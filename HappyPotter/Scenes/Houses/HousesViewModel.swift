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

    func fetchHouses()
}

final class HousesViewModel: HousesViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: HousesCoordinator?
    private var service: HousesServiceProtocol
    var houses: [House] = []

    // MARK: - Initializer
    init(coordinator: HousesCoordinator? = nil, service: HousesService = HousesService()) {
        self.coordinator = coordinator
        self.service = service
    }

    func fetchHouses() {
        let route = HousesRoute.fetchHouses
        
        service.fetchHouses(route) { [weak self] (result: Result<[House], ErrorHandler>) in
            switch result {
            case .success(let dataSource):
                print("dataSource \(dataSource)")
            case .failure(let error) :
                print("error \(error)")
            }
        }
    }
}
