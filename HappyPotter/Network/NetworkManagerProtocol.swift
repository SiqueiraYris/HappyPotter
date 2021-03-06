//
//  NetworkManagerProtocol.swift
//  HappyPotter
//
//  Created by Siqueira on 09/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func requestObject<T: Decodable>(with config: RequestConfiguration,
                                     completion: @escaping (Result<T, ErrorHandler>) -> Void)

    @discardableResult
    func receive(on queue: DispatchQueue) -> Self
}
