//
//  NetworkRoute.swift
//  HappyPotter
//
//  Created by Siqueira on 09/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

protocol NetworkRoute {
    var configuration: RequestConfiguration { get }
}
