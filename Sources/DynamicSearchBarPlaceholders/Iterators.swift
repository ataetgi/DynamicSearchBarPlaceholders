//
//  Iterators.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 29.09.2021
//  Copyright © 2021 Ata Etgi. All rights reserved.
//

struct InfiniteIterator<Iterator: IteratorProtocol>: IteratorProtocol {
    private let sampleIterator: Iterator
    private var currentIterator: Iterator
    
    init(_ sample: Iterator) {
        self.sampleIterator = sample
        self.currentIterator = sampleIterator
    }
    
    mutating func next() -> Iterator.Element? {
        if let next = currentIterator.next() {
            return next
        } else {
            self.currentIterator = sampleIterator
            return currentIterator.next()
        }
    }
}

extension IteratorProtocol {
    func infinite() -> InfiniteIterator<Self> {
        InfiniteIterator(self)
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let count = self.count
        guard count > 1 else { return }
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: count, to: 1, by: -1)) {
            let distance = Int.random(in: 1...unshuffledCount)
            let i = index(firstUnshuffled, offsetBy: distance)
            self.swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    func shuffled() -> [Iterator.Element] {
        var shuffling = Array(self)
        shuffling.shuffle()
        return shuffling
    }
}
