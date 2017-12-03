//
//  MedianOfTwoSortedArrays.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 9/11/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

class MedianOfTwoSortedArrays {

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var median = 0.0
        let mergedArray = merge(leftPile: nums1, rightPile: nums2)
        
        let mid = mergedArray.count / 2
        if mergedArray.count % 2 == 0 {
            median = Double(mergedArray[mid] + mergedArray[mid-1]) / 2.0
        }
        else {
            median = Double(mergedArray[mid])
        }
        
        return median
    }
    
    func findTheRunningMedian() {
        let numsCount = Int(readLine()!)!
        var list: [Int] = [Int(readLine()!)!]
        print(Float(String(format: "%.1f", list.first!))!)
        
        for _ in 1..<numsCount {
            let num = Int(readLine()!)!
            list = merge(leftPile: list, rightPile: [num])
            print(median(list))
        }
    }
    
    private func median(_ array: [Int]) -> Float {
        if array.count % 2 == 0 {
            return Float(String(format: "%.1f", array[array.count/2]))!
        }
        return Float(String(format: "%.1f", (array[array.count/2] + array[array.count/2-1])/2))!
    }
    
    private func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        // 1
        var leftIndex = 0
        var rightIndex = 0
        
        // 2
        var orderedPile = [Int]()
        
        // 3
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        // 4
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
}

//func reverse(_ x: Int) -> Int {
//    var rev = 0
//    var num = x
//    while (num != 0)
//    {
//        rev = rev * 10 + num % 10
//        num /= 10
//    }
//    return rev
//}

