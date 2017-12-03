//
//  StringsProblems.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 10/14/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

/////////  Funny String  /////////
//func funnyString(_ str: String) -> Bool {
//    let reversed = str.reversed()
//
//    for i in 1..<str.count {
//        let strIndex1 = str.index(str.startIndex, offsetBy: i)
//        let strIndex2 = str.index(str.startIndex, offsetBy: i-1)
//
//        let reversedIndex1 = reversed.index(reversed.startIndex, offsetBy: i)
//        let reversedIndex2 = reversed.index(reversed.startIndex, offsetBy: i-1)
//
//        if UnicodeScalar(String(str[strIndex1])) - UnicodeScalar(String(str[strIndex2])) !=
//            UnicodeScalar(String(reversed[reversedIndex1])) - UnicodeScalar(String(reversed[reversedIndex2])) {
//            return false
//        }
//    }
//
//    return true
//}

////////// CamelCase //////////
func camelCase (_ words: String) -> Int {
    let words = words.filter({String($0).uppercased() == String($0)})
    return words.count + 1
}

////////// Super Reduced String ////////
func superReducedString (_ str: String) -> String {
    if str.isEmpty {
        return "Empty String"
    }
    var _str = str
    
    for i in 0..<_str.characters.count-1 {
        let index1 = _str.index(_str.startIndex, offsetBy: i)
        let index2 = _str.index(_str.startIndex, offsetBy: i+1)
        
        if(_str[index1] == _str[index2]) {
            let range = _str.index(_str.startIndex, offsetBy: i)..._str.index(_str.startIndex, offsetBy: i+1)
            _str.removeSubrange(range)
            return superReducedString(_str)
        }
    }
    return _str
}
