//
//  Placeholders.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 29.09.2021
//  Copyright © 2021 Ata Etgi. All rights reserved.
//

import UIKit

final class Placeholders<Element> {
    private(set) var iterator: AnyIterator<Element>
    private(set) var timer: Timer?
    private var placeholderAction: ((Element) -> ())? = nil
    private var placeholderOptions: PlaceholdersOptions?
    private(set) var placeholderCount: Int?
    private var timeInterval: TimeInterval?
    private var fireInitial: Bool?
    public private(set) var lastElement: Element?
    
    public var isConfigured: Bool {
        placeholderAction != nil && fireInitial != nil && timeInterval != nil
    }

    private init<Iterator : IteratorProtocol>(iterator: Iterator) where Iterator.Element == Element {
        self.iterator = AnyIterator(iterator)
    }
    
    convenience init(placeholders: [Element], options: PlaceholdersOptions = []) {
        var finalPlaceholders = placeholders
        if options.contains(.shuffle) { finalPlaceholders.shuffle() }
        if options.contains(.infinite) {
            self.init(iterator: finalPlaceholders.makeIterator().infinite())
        } else {
            self.init(iterator: finalPlaceholders.makeIterator())
        }
        self.placeholderCount = finalPlaceholders.count
        self.placeholderOptions = options
    }

    deinit {
        timer?.invalidate()
    }
    
    func start(interval: TimeInterval, fireInitial: Bool, action: @escaping (Element) -> ()) {
        timer?.invalidate()
        self.placeholderAction = action
        self.timeInterval = interval
        self.fireInitial = fireInitial
        let timer = Timer(timeInterval: interval,
                          target: self,
                          selector: #selector(act(timer:)),
                          userInfo: nil,
                          repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        self.timer = timer
        if fireInitial, let firstPlaceholder = iterator.next() {
            action(firstPlaceholder)
        }
    }

    func stop() {
        timer?.invalidate()
        var newSortedItems = iterator.prefix(placeholderCount ?? .zero).map({$0}) as [Element]
        lastElement = newSortedItems.last
        if let options = placeholderOptions {
            if options.contains(.shuffle) { newSortedItems.shuffle() }
            if options.contains(.infinite) {
                iterator = AnyIterator(newSortedItems.makeIterator().infinite())
            } else {
                iterator = AnyIterator(newSortedItems.makeIterator())
            }
        }
        else {
            iterator = AnyIterator(newSortedItems.makeIterator())
        }
    }

    func resume() {
        timer?.invalidate()
        if let interval = timeInterval,
           let fireInitial = fireInitial,
           let placeholderAction = placeholderAction {
            start(interval: interval, fireInitial: fireInitial, action: placeholderAction)
        }
    }

    @objc private func act(timer: Timer) {
        if let nextPlaceholder = iterator.next() {
            placeholderAction?(nextPlaceholder)
        } else {
            timer.invalidate()
        }
    }
}
