//
//  ConfigurationConstants.swift
//  HappyPotter
//
//  Created by Siqueira on 31/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

private let configurationJson: [String: Any]? = {
    guard
        let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
        let dicInfo = NSDictionary(contentsOfFile: path),
        let dicConfig = dicInfo["Configurations"] as? [String: Any]
        else { return nil }

    return dicConfig
}()

var serverHost: String = {
    guard let serverHost = configurationJson?["host"] as? String else { return "" }

    return serverHost
}()

var uriScheme: String = {
    guard let uriScheme = configurationJson?["scheme"] as? String else { return "" }

    return uriScheme
}()

var apiKey: String = {
    guard let apiKey = configurationJson?["apiKey"] as? String else { return "" }

    return apiKey
}()

var housesPath: String = {
    guard let housesPath = configurationJson?["housesPath"] as? String else { return "" }

    return housesPath
}()

var charactersPath: String = {
    guard let charactersPath = configurationJson?["charactersPath"] as? String else { return "" }

    return charactersPath
}()

var spellsPath: String = {
    guard let spellsPath = configurationJson?["spellsPath"] as? String else { return "" }

    return spellsPath
}()
