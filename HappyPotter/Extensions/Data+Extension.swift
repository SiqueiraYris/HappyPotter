//
//  Data+Extension.swift
//  HappyPotter
//
//  Created by Siqueira on 09/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

extension Data {
    var value: Data {
        guard self.isEmpty,
            let data = "{}".data(using: .utf8) else {
            return self
        }
        return data
    }
}
