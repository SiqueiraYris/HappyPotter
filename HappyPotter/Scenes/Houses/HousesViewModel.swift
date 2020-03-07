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

    private var coordinator: HousesCoordinator?
    var houses: [House] = []
    
    init(coordinator: HousesCoordinator? = nil/*, service: StatementServiceProtocol = StatementService()*/) {
        self.coordinator = coordinator
//        self.service = service
    }
    
    func fetchHouses() {
//        let route = LocateRoute.fetchCoordinates(mapLocation.coordinate.latitude,
//                                                 mapLocation.coordinate.longitude,
//                                                 userLocation.coordinate.latitude,
//                                                 userLocation.coordinate.longitude,
//                                                 distance, search)
//
//        loading.value = true
//        isSearchInThisArea.value = false
//
//        service.fetchCoordinates(route) { [weak self] (result: Result<[Locate], ErrorHandler>) in
//            guard let self = self else { return }
//
//            self.loading.value = false
//
//            switch result {
//            case .success(let dataSource) :
//                let cellViewModel = dataSource.compactMap {
//                    MapCellViewModel(locate: $0,
//                                     locateAnnotation: self.attemptToAssembleAnnotation(with: $0))
//                }
//                self.coordinates = cellViewModel
//                self.filteredCoordinates.value = cellViewModel
//                self.displayMessage.value = cellViewModel.isEmpty
//                if search == nil {
//                    self.isSearchInThisArea.value = cellViewModel.isEmpty
//                }
//            case .failure(let error) :
//                self.error.value = error
//            }
//            self.filterByType()
//        }
    }

}
