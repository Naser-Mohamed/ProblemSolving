//
//  Edge.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/23/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

public class Edge: Equatable {
    public var neighbor: Node
    
    public init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
