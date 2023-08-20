//
//  DynamicSearchBar.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 19.08.2023.
//  Copyright © 2021 Ata Etgi. All rights reserved.
//

import UIKit

open class DynamicSearchBar: UISearchBar {
    private var placeholders: Placeholders<String> = .init(placeholders: [])

    public override init(frame: CGRect) {
        super.init(frame: frame)
        textfield?.clipsToBounds = true
    }

    public convenience init(placeholders: [String],
                     timeInterval: TimeInterval = 2,
                     direction: TransitionPushDirection = .fromTop,
                     placeholdersOptions: PlaceholdersOptions = [.infinite]) {
        self.init()
        self.placeholders = Placeholders(placeholders: placeholders, options: placeholdersOptions)
        guard let textfield = textfield else { return }
        self.placeholders.start(interval: timeInterval,
                                fireInitial: true,
                                textField: textfield,
                                animation: .pushTransition(direction))
    }

    public func stopPlaceholders() {
        placeholders.stop()
    }

    public func resumePlaceholders() {
        placeholders.resume()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var textfield: UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            return value(forKey: "_searchField") as? UITextField
        }
    }
}
