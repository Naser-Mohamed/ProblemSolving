//
//  Project Euler.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/30/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import Foundation

//////// Project Euler #7: 10001st prime /////////////

var allPrimesToN: [Int] = []

func isPrime(_ number: Int) -> Bool {
    
    if number < 2 {
        return false;
    }
    let numSqrt = Int(sqrt(Double(number)))
    for i in 2...numSqrt {
        if number % i == 0 {
            return false
        }
    }
    return true
}


//////// Project Euler #8: Largest product in a series /////////

func getLargestProduct(_ numString: String, k: Int) -> UIntMax {
    var largestProduct: UIntMax = 0
    let count = numString.characters.count

    for i in 0...(count - k) {
        let start = numString.index(numString.startIndex, offsetBy: i)
        let end = numString.index(numString.endIndex, offsetBy: -(count-i-k))
        let range = start..<end
        let subStringNum = numString.substring(with: range)
        
        var tempProduct: UIntMax = 1
        for char in subStringNum.characters {
            tempProduct *= UIntMax(String(char))!
        }
        
        largestProduct = tempProduct > largestProduct ? tempProduct : largestProduct
    }
    
    return largestProduct
}


/////////// Project Euler #6: Sum square difference ///////////

func sumSquareDifference(_ num: Int) -> Int {
    var sum: UInt64 = 0
    var sumSquare: UInt64 = 0
    for i in 1...num {
        sum += UInt64(i)
        sumSquare += UInt64(i*i)
    }
    sum *= sum
    return abs(Int(sum - sumSquare))
}
