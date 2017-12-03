//
//  Queue.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/23/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

public struct Queue<T> {
    private var array: [T]
    
    public init() {
        array = []
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public func peek() -> T? {
        return array.first
    }
}
