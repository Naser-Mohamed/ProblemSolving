//
//  ViewController.swift
//  HackerRankSwift
//
//  Created by Naser Mohamed on 8/11/17.
//  Copyright © 2017 Naser Mohamed. All rights reserved.
//

import UIKit

func degreeOfArray(arr: [Int]) -> Int {
    
    var frequencies = [Int: (firstIndex: Int, lastIndex: Int, count: Int)]()
    var maxFrequency = 0
    for i in 0..<arr.count {
        if frequencies[arr[i]] == nil {
            frequencies[arr[i]] = (i, i, 1)
        }
        else {
            frequencies[arr[i]]?.count += 1
            frequencies[arr[i]]?.lastIndex = i
            
            if (frequencies[arr[i]]?.count)! > maxFrequency {
                maxFrequency = (frequencies[arr[i]]?.count)!
            }
        }
    }
    
    var output = arr.count
    for item in frequencies {
        if item.value.count == maxFrequency && (item.value.lastIndex - item.value.firstIndex) < output {
            output = item.value.count
        }
    }
    
    return output
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    class func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var current = head
        var prev: ListNode?
        var next: ListNode?
        
        while(current != nil) {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        return prev
    }
    
    class func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        if head == nil {
            return head
        }
        
        var headNode = head
        while headNode?.next != nil {
            if (headNode?.next?.val == val) {
                headNode?.next = headNode?.next?.next
            }
            else {
                headNode = headNode?.next
            }
        }
        
        return head?.val == val ? head?.next : head
    }
}

func containsDuplicate(_ nums: [Int]) -> Bool {
    var distinctNumbers: Set<Int> = Set()
    
    for num in nums {
        if distinctNumbers.contains(num) {
            return true
        }
        distinctNumbers.insert(num)
    }
    
    return false
}

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count == 0 {
        return false
    }
    for i in 0..<(nums.count-1) {
        if nums[i] == nums[i+1] {
            return true
        }
    }
    return false
}

struct Number {
    var count = 0
    var start = -1
    var end = -1
}
func findShortestSubArray(_ nums: [Int]) -> Int {
    
    if nums.count == 0 {
        return 0
    }
    var counts: [Int: Number] = [:]
    var maxDegree: Int = 0
    var smallestLength = nums.count
    
    for i in 0..<nums.count {
        if (counts.keys.contains(nums[i])) {
            counts[nums[i]]?.count += 1
            counts[nums[i]]?.end = i
            
            if ((counts[nums[i]]?.count)! >= maxDegree) {
                maxDegree = (counts[nums[i]]?.count)!
            }
        }
        else {
            counts[nums[i]] = Number(count: 1, start: i, end: i)
            maxDegree = maxDegree == 0 ? 1 : maxDegree
        }
    }
    
    
    counts.filter({$0.value.count == maxDegree}).forEach { (key, value) in
        if (value.end - value.start + 1) < smallestLength {
            smallestLength = (value.end - value.start + 1)
        }
    }
    
    return smallestLength
}

func checkPossibility(_ nums: [Int]) -> Bool {
    if nums.count <= 1 {
        return true
    }
    var decreasingCount = 0
    var lastMax = nums[1]
    
    for i in 1..<nums.count {
        if nums[i] < lastMax {
            decreasingCount += 1
        }
        else {
            lastMax = nums[i]
        }
    }
    
    if nums[1] < nums[0] {
        decreasingCount += 1
    }
    
    return decreasingCount <= 1
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(checkPossibility([-1,4,2,3]))
        
//        let tstCase = String(readLine()!)!
//        print(camelCase(tstCase))
        
//        let p = PalindromeNumber()
//        print(p.isPalindrome(121))

        
        
//        let tstCases = Int(readLine()!)!
//        for _ in 1...tstCases {
//            let line1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//            let num = Int(readLine()!)!
//            
//            print(getLargestProduct(String(num), k: line1[1]))
//        }

        
//        var stack1: [Int] = []
//        var stack2: [Int] = []
//        var stack3: [Int] = []
//        
//        let stack1Heights = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        let stack2Heights = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        let stack3Heights = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        
//        for item in stack1Heights.reversed() {
//            stack1.append((stack1.last ?? 0) + item)
//        }
//        for item in stack2Heights.reversed() {
//            stack2.append((stack2.last ?? 0) + item)
//        }
//        for item in stack3Heights.reversed() {
//            stack3.append((stack3.last ?? 0) + item)
//        }
//        
//        for item in stack1.reversed() {
//            if stack2.contains(item) && stack3.contains(item) {
//                print(item)
//                break
//            }
//        }
//        print("0")
        
//        let root = TreeNode(value: "root")
//        let child1 = TreeNode(value: "child1")
//        let child2 = TreeNode(value: "child2")
//        let child3 = TreeNode(value: "child3")
//        let child4 = TreeNode(value: "child4")
//        
//        root.add(child: child1)
//        root.add(child: child2)
//        
//        child1.add(child: child3)
//        child2.add(child: child4)
//        
//        print(root.description)
//        
//        print(root.search(value: child2.value)!)
        
        ////// Time Complexity: Primality //////////
        
//        func isPrime(_ number: Int) -> Bool {
//            
//            if number < 2 {
//                return false;
//            }
//            let numSqrt = Int(sqrt(Double(number)))
//            for i in 2...numSqrt {
//                if number % i == 0 {
//                    return false
//                }
//            }
//            return true
//        }
        
//        let tstCases = Int(readLine()!)!
//        for _ in 1...tstCases {
//            let number = Int(readLine()!)!
////            let isPrime = number > 1 && !(2..<number).contains { number % $0 == 0 }
////            
//            print(isPrime(number) ? "Prime" : "Not prime")
//        }
        
        ////// Recursion: Fibonacci Numbers ///////////
        
//        func fibonacci (n: Int) -> Int {
//            if n == 0 {
//                return 0
//            }
//            if n == 1 {
//                return 1
//            }
//            else {
//                return fibonacci(n: n-1) + fibonacci(n: n-2)
//            }
//        }
        
        
        ////// Binary Search: Ice Cream Parlor  //////////
        
//        let tripsNum = Int(readLine()!)!
//        var money = 0
//        var flavors = 0
//        var found = false
//        var output: (Int, Int) = (-1, -1)
//        for _ in 1...tripsNum {
//            money = Int(readLine()!)!
//            flavors = Int(readLine()!)!
//            let flavorsCosts = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//            
//            for i in 0..<flavors-2 {
//                found = false
//                if flavorsCosts[i] >= money {
//                    continue
//                }
//                for j in i+1..<flavors-1 {
//                    if flavorsCosts[i] + flavorsCosts[j] == money {
//                        output = (i, j)
//                        found = true
//                        break
//                    }
//                }
//                if found {
//                    print(output.0 > output.1 ? "\(output.0 + 1) \(output.1 + 1)" : "\(output.1 + 1) \(output.0 + 1)")
//                    break
//                }
//            }
//        }
//        
        
        /////////
//        var n = 6
//        for i in 1...n {
//            for k in (1 ... n) {
//                if k <= n-i {
//                    print(" ", terminator: "")
//                }
//                else{
//                    print("#", terminator: "")
//                }
//            }
//            print()
//        }
        
        ////////// Angry Professor ////////
        
//        let testCases = Int(readLine()!)!
//        for i in 1...testCases {
//            let StudentsAndThreshold = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//            let arrivalTimes = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//            
//            if (arrivalTimes.filter({$0 <= 0})).count > StudentsAndThreshold[1] {
//                print("YES")
//            }
//            else {
//                print("NO")
//            }
//        }
        
        ////////// Beautiful Days at the Movies ////////
        
//        var beautifulDays = 0
////        let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        let input = [1, 2000000, 1000000000]
//        for n in input[0]...input[1] {
//            if abs(n - Int(String("\(n)".characters.reversed()))!) % input[2] == 0 {
//                beautifulDays += 1
//            }
//        }
//        print(beautifulDays)
        
        
        /////// Utopian Tree /////
        
//        let tests = [0, 1, 4]
//        for var N in tests {
//            var H = 0
//            for var counter in 0...N {
//                if counter % 2 == 0 {
//                    H += 1
//                }
//                else {
//                    H *= 2
//                }
//                counter += 1
//            }
//            print(H)
//        }
        
        /////// Arrays - DS ///////
        
//        let arr = [1,2,3,4,5,6]
//        for item in arr.reversed() {
//            print("\(item) ", terminator: "")
//        }
        
        
        /////// 2D Array - DS ///////
        
//        var arr: [[Int]] = [[-1, -1, 0, -9, -2, -2], [-2, -1, -6, -8, -2, -5], [-1, -1, -1, -2, -3, -4], [-1, -9, -2, -4, -4, -5], [-7, -3, -3, -2, -9, -9], [-1, -3, -1, -2, -4, -5]]
//        var result = -100000
//        for i in 0..<(arr.count-2) {
//            for j in 0..<(arr[i].count-2) {
//                var tempRes = (Array(arr[j][i...(i+2)]) ).reduce(0, +)
//                var arraySlice: [Int] = Array(arr[j+1][i...(i+2)]) 
//                arraySlice[0] = 0
//                arraySlice[2] = 0
//                tempRes += arraySlice.reduce(0, +)
//                tempRes += (Array(arr[j+2][i...(i+2)]) ).reduce(0, +)
//                result = tempRes > result ? tempRes : result
//            }
//        }
//        
//        print(result)
        
        
        //////// Left Rotation /////////
        
//        let firstLine = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        let elements = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        
//        for n in (Array(elements[firstLine[1]..<elements.count]) + Array(elements[0..<firstLine[1]])) {
//            print("\(n) ", terminator: "")
//        }
        
        
        /////// Sparse Arrays ///////
        
//        let numOfStrings = Int(readLine()!)!
//        var strings: [String] = []
//        for _ in 1...numOfStrings {
//            strings.append(String(readLine()!)!)
//        }
//
//        let numOfQueries = Int(readLine()!)!
//        for _ in 1...numOfQueries {
//            let query = String(readLine()!)!
//            print(strings.filter({$0 == query}).count)
//        }
        
        
        ///// Array Manipulation /////////
        
//        let firstLine = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//        var arr = Array(repeating: 0, count: firstLine[0])
//        for _ in 1...firstLine[1] {
//            let testCase = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//            for i in testCase[0]-1...testCase[1]-1 {
//                arr[i] += testCase[2]
//            }
//        }
//        print(arr.max())
        
        
        ////////// String Construction //////////
        
//        let numOfStrings = Int(readLine()!)!
//        for _ in 1...numOfStrings {
//            let str = String(readLine()!)!
//            print(Set(Array(str.characters)).count)
//        }
        
        
        /////// Sherlock and the Valid String //////
        
//        let string = String(readLine()!)!
//        let stringChars = Set(string.characters)
//        
//        var charsValues: [(char: Character, count: Int)] = []
//        var isValid = true
//        for char in stringChars {
//            if let _ = charsValues.index(where: {$0.char == char}) {
//                continue
//            }
//            else {
//                let count = string.characters.filter({$0 == char}).count
//                charsValues.append((char: char, count: count))
//            }
//        }
//        
//        if Set(charsValues.map({$0.count})).count > 2 {
//            isValid = false
//        }
//        print(isValid ? "YES" : "NO")
        
        
        //////// Stacks: Balanced Brackets //////////
        
//        let brackets: [Character: Character] = ["[":"]", "{":"}", "(":")"]
        
        
        
//        let tsts = ["{[()]}", "{[(])}", "{{[[(())]]}}"]
//        let openBrackets: [Character] = ["[", "{", "("]
//        let closeBrackets: [Character] = ["]", "}", ")"]
////        let tstCases = Int(readLine()!)!
//        for tstCase in tsts {
////            let tstCase = String(readLine()!)!
//            var isBalanced = true
//            var openedBrackets: [Character] = []
//            for char in tstCase.characters {
//                if openBrackets.contains(char) {
//                    openedBrackets.append(char)
//                }
//                else {
//                    if openedBrackets.count == 0 || closeBrackets.index(of: char) != openBrackets.index(of: openedBrackets.last!) {
//                        isBalanced = false
//                        break
//                    }
//                    else {
//                        openedBrackets.removeLast()
//                    }
//                }
//            }
//            if openedBrackets.count > 0 {
//                isBalanced = false
//            }
//            print(isBalanced ? "YES" : "NO")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

