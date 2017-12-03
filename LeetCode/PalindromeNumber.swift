//
//  PalindromeNumber.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 9/11/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

class PalindromeNumber {

    func isPalindrome(_ x: Int) -> Bool {
        var num = x
        if (num < 0) {
            return false
        }
        
        var div = 1
        while (num / div >= 10)
        {
            div *= 10
        }
        
        while (num != 0)
        {
            let l = num / div
            let r = num % 10
            if (l != r) {
                return false
            }
            
            num = (num % div) / 10
            div /= 100
        }
        return true
    }
}
