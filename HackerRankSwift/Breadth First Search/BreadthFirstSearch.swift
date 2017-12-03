//
//  BreadthFirstSearch.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/23/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

func breadthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var queue = Queue<Node>()
    queue.enqueue(source)
    
    var nodesExplored = [source.label]
    source.visited = true
    
    while let current = queue.dequeue() {
        for edge in current.neighbors {
            let neighborNode = edge.neighbor
            if !neighborNode.visited {
                queue.enqueue(neighborNode)
                neighborNode.visited = true
                nodesExplored.append(neighborNode.label)
            }
        }
    }
    
    return nodesExplored
}
