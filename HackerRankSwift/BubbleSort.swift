//
//  BubbleSort.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/20/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

class BubbleSort: NSObject {
    func bubbleSort() {
        let n = Int(readLine()!)!
        var elements = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        
        var allSwaps = 0
        var numOfSwaps = 0
        for _ in 0..<elements.count {
            numOfSwaps = 0
            for j in 0..<elements.count-1 {
                if (elements[j] > elements[j + 1]) {
                    swap(&elements[j], &elements[j+1])
                    numOfSwaps += 1
                }
            }
            // If no elements were swapped during a traversal, array is sorted
            if (numOfSwaps == 0) {
                break;
            }
            allSwaps += numOfSwaps
        }
        
        print("Array is sorted in \(allSwaps) swaps.")
        print("First Element: \(elements.first!)")
        print("Last Element: \(elements.last!)")
    }
}
