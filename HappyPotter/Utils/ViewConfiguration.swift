//
//  ViewConfiguration.swift
//  HappyPotter
//
//  Created by Siqueira on 10/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

public protocol ViewConfiguration: AnyObject {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    public func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    public func configureViews() {}
}
