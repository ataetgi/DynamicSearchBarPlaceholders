//
//  PlaceholdersOptions.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 19.08.2023.
//  Copyright © 2023 Ata Etgi. All rights reserved.
//

import Foundation

public struct PlaceholdersOptions: OptionSet {
    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static var infinite = PlaceholdersOptions(rawValue: 1 << 0)
    public static var shuffle = PlaceholdersOptions(rawValue: 1 << 1)
}
