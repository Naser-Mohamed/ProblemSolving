//
//  DepthFirstSearch.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/23/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var nodesExplored = [source.label]
    source.visited = true
    
    for edge in source.neighbors {
        if !edge.neighbor.visited {
            nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
        }
    }
    return nodesExplored
}
