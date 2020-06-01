//
//  Algorithms.swift
//  Algorithms
//
//  Created by Stanley Jin on 16/1/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

class Algorithms
{
    static let shared = Algorithms()
    
    // MARK: - Find max
    
    func brutalFindMaxSub(_ A: [Int]) -> (Int, Int, Int)
    {
        var sum = 0
        var low = 0
        var high = 0
        for i in 0..<A.count
        {
            for j in i..<A.count
            {
                var ls = 0
                
                for n in i..<j
                {
                    ls += A[n]
                }
                
                if ls > sum
                {
                    sum = ls
                    low = i
                    high = j
                }
            }
        }
        
        return (sum, low, high)
    }
    
    
    func findMaxSubarray(_ A: [Int], low: Int, high: Int) -> (Int, Int, Int) {
        if high == low
        {
            return (low, high, A[low])
        }
        else
        {
            print("low", low, "high", high)
            let mid = (low + high) / 2
            let (leftLow, leftHigh, leftSum) = findMaxSubarray(A, low: low, high: mid)
            print("leftlow", leftLow, "lefthigh", leftHigh ,"leftsum", leftSum)
            
            let (rightLow, rightHigh, rightSum) = findMaxSubarray(A, low: mid + 1, high: high)
            print("rightlow", rightLow, "righthigh", rightHigh, "rightSum", rightSum)
            let (crossLow, crossHigh, crossSum) = findCrossMaxSubarray(A, low: low, mid: mid, high: high)
            
            print("crossLow", crossLow, "crossHight", crossHigh, "crossSum", crossSum)
            if leftSum > rightSum && leftSum > crossSum
            {
                print("result", leftLow, leftHigh, leftSum)
                return (leftLow, leftHigh, leftSum)
            }
            else if rightSum > leftSum && rightSum > crossSum
            {
                
                print("result", rightLow, rightHigh, rightSum)
                return (rightLow, rightHigh, rightSum)
            }
            else
            {
                
                print("result", crossLow, crossHigh, crossSum)
                return (crossLow, crossHigh, crossSum)
            }
        }
    }
    
    func findCrossMaxSubarray(_ A: [Int], low: Int, mid: Int, high: Int) -> (Int, Int, Int)
    {
        var leftSum = 0
        var rightSum = 0
        var leftLow = 0
        var rightHigh = 0
        for i in low...mid
        {
            var sLeftSum = 0
            for n in i...mid
            {
                sLeftSum += A[n]
            }
            
            if sLeftSum > leftSum
            {
                leftSum = sLeftSum
                leftLow = i
            }
        }
        
        for i in mid + 1...high
        {
            var sRightSum = 0
            
            for n in mid + 1...i
            {
                sRightSum += A[n]
            }
            
            
            if sRightSum > rightSum
            {
                rightSum = sRightSum
                rightHigh = i
            }
        }
        
        if rightSum < 1
        {
            rightSum = 0
            rightHigh = mid
        }
        
        if leftSum < 1
        {
            leftSum = 0
            leftLow = mid
        }
        
        return (leftLow, rightHigh, leftSum + rightSum)
    }
    
    // MARK: - HeapSort
    func maxHeapify()
    {
        
    }
    
    func right(_ i: Int) -> Int
    {
        return i * 2 + 1
    }
    
    func left(_ i: Int) -> Int
    {
        return i * 2
    }
    
    func getValue(_ input: String) -> Int {
        let opers = ["+", "-", "*"]
        
        var op = ""
        
        for i in opers
        {
            if input.contains(i)
            {
                op = i
            }
        }
        
        let comps = input.components(separatedBy: op)
        
        let values = comps.compactMap{Int($0)}
        
        switch op
        {
        case "+": return values[0] + values[1]
        case "-": return values[0] - values[1]
        case "*": return values[0] * values[1]
        default: return 0
        }
    }
    
    func findDuplicate(_ arr: [Int]) -> [Int] {
        var loc = arr
        let length = arr.count
        var result = [Int]()
        
        for i in 0..<length
        {
            while i != loc[i]
            {
                if loc[i] == loc[loc[i]]
                {
                    result.append(loc[i])
                }
                else
                {
                    let temp = loc[i]
                    loc[i] = loc[temp]
                    loc[temp] = temp
                }
            }
        }
        
        return result
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        print("c:", matrix[0])
        if matrix.count == 0
        {
            print("returning false")
            return false
        }
        
        if  matrix[0].count == 0
        {
            return false
        }
        let cols = matrix[0].count
        let rows = matrix.count
        
        let left = 0
        let right = cols * rows
        
        return binarySearchMatrix(matrix, left: left, right: right, target: target)
    }
    
    func binarySearchMatrix(_ matrix: [[Int]], left: Int, right: Int, target: Int) -> Bool
    {
        print("left", left, "right", right, "target", target)
        let cols = matrix[0].count
        
        if left > right
        {
            print("returning false")
            return false
        }
        else
        {
            print("going in")
            let mid = left + (right - left) / 2
            print("mid", mid)
            let midValue = matrix[mid / cols][mid % cols]
            print("midVale", midValue)
            
            if midValue == target
            {
                print("returning true")
                return true
            }
            else if midValue > target
            {
                print(">, right", mid - 1)
                return binarySearchMatrix(matrix, left: left, right: mid - 1, target: target)
            }
            else
            {
                print("<, left", mid + 1)
                return binarySearchMatrix(matrix, left: mid + 1, right: right, target: target)
            }
        }
    }
    
    // MARK: DP
    
    func divisorGameFirstPersonWin(_ n: Int) -> Bool
    {
        var res = 0
        var n = n
        var i = 0
        while i < n
        {
            if n % i == 0
            {
                n = n - i
                res += 1
                i = 0
                continue
            }
            
            i += 1
        }
        [Int].init(repeating: 100, count: 0)
        
        return res % 2 != 0
    }
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = [Int].init(repeating: 0, count: cost.count)
        
        print("a")
        dp[0] = cost[0]
        
        print("a")
        dp[1] = cost[1]
        
        print("a")
        
        var i = 2
        
        print("a")
        while i < cost.count
        {
            print(i)
            dp[i] = min((dp[i-1] + cost[i]), (dp[i-2] + cost[i]))
            i += 1
        }
        
        return min(dp[i-2], dp[i-1])
    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count == 0
        {
            return true
        }
        
        if t.count == 0
        {
            return false
        }
        
        var s_poi = 0
        let sCar = Array(s)
        
        while s_poi < s.count
        {
            for item in t
            {
                if item == sCar[s_poi]
                {
                    if s_poi == s.count
                    {
                        return true
                    }
                    s_poi += 1
                }
            }
            return false
        }
        
        return false
    }
    
    static func rob(_ nums: [Int]) -> Int {
        return rb(nums, nums.count - 1)
    }
    
    static func rb(_ nums: [Int], _ i: Int) -> Int
    {
        if i < 0
        {
            return 0
        }
        
        return max(rb(nums, i - 1), rb(nums, i - 2) + nums[i])
    }
    
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        let h = mat.count
        let w = mat[0].count
        var ii = [[Int]].init(repeating: [Int].init(repeating: -1, count: w), count: h)
        for i in 0..<h
        {
            var sum = 0
            for j in 0..<w
            {
                sum += mat[i][j]
                if i == 0
                {
                    ii[i][j] = sum
                }
                else
                {
                    ii[i][j] = ii[i - 1][j] + sum
                }
            }
        }
        
        print("ii", ii)
        var res = [[Int]].init(repeating: [Int].init(repeating: -1, count: w), count: h)
        for i in 0..<h
        {
            for j in 0..<w
            {
                print("i", i)
                print("j", j)
                let r1 = i - K - 1
                let r2 = min(i + K, h - 1)
                let c1 = j - K - 1
                let c2 = min(j + K, w - 1)
                var ul = 01
                print("r1",r1)
                print("c1", c1)
                if c1 > -1 && r1 > -1
                {
                    ul = ii[r1][c1]
                }
                print("ul")
                print(ul)
                var ur = 0
                print("r1",r1)
                print("c2",c2)
                if r1 > -1 && c2 > -1
                {
                    ur = ii[r1][c2]
                }
                print("ur", ur)
                print("r2",r2)
                print("c1",c1)
                var ll = 0
                if r2 > -1 && c1 > -1
                {
                    ll = ii[r2][c1]
                }
                print("ll", ll)
                var lr = ii[r2][c2]
                print("lr", lr)
                let resu = ul + lr - ur - ll
                print("resu", resu)
                res[i][j] = resu
            }
        }
        return res
    }
    
    struct DP {
        struct mctFromLeafValue {
            static func mctFromLeafValues(_ arr: [Int]) -> Int {
                if arr.count == 0
                {
                    return 0
                }
                return dp(arr, 0, arr.count - 1)
            }
            
            static func dp(_ arr: [Int], _ s: Int, _ e: Int) -> Int
            {
                if s == e
                {
                    return 0
                }
                var ans = Int.max
                for i in s...e
                {
                    var l = Int.min
                    var r = Int.min
                    for j in s...i
                    {
                        l = max(arr[j], l)
                    }
                    for k in i...e
                    {
                        r = max(arr[k], e)
                    }
                    ans = min(dp(arr, s, i) + dp(arr, i + 1, e) + l * r, ans)
                }
                return ans
            }
        }
        
        struct stoneGame {
            
            static var dp: [[[Int]]] =  [[[Int]]]()
            
            static func stoneGame(_ piles: [Int]) -> Int {
                dp = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: piles.count), count: piles.count), count: piles.count)
                return stoneGameDp(piles, 0, piles.count - 1, true)            }
            
            static func stoneGameDp(_ arr: [Int],_ l: Int,_ r: Int,_ Alex: Bool) ->  Int
            {
                if arr.count == 0
                {
                    return 0
                }
                
                if l == r
                {
                    return arr[l]
                }
                
                let flag = Alex ? 0 : 1
                
                if dp[l][r][flag] == 0
                {
                    if Alex
                    {
                        let res = max(stoneGameDp(arr, l + 1, r, false) + arr[l], stoneGameDp(arr, l, r - 1, false) + arr[r])
                                           dp[l][r][flag] = res
                                           return res
                    }
                    else
                    {
                        let res = min(stoneGameDp(arr, l + 1, r, true) - arr[l], stoneGameDp(arr, l, r - 1, true) - (arr[r]))
                        
                        dp[l][r][flag] = res
                        return res
                    }
                }
                else
                {
                    return dp[l][r][flag]
                }
            }
        }
        
        struct stoneGameStand {
            static func stoneGame(_ arr: [Int]) -> Int
            {
                var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: -1, count: arr.count), count: arr.count)
                
                for i in 0..<dp.count
                {
                    dp[i][i] = arr[i]
                }
                
                for d in 2..<arr.count + 1
                {
                    for i in 0..<arr.count
                    {
                        let j = i + d - 1
                        if j > arr.count - 1
                        {
                            continue
                        }
                        dp[i][j] = max(arr[i] - dp[i + 1][j], arr[j] - dp[i][j - 1])
                    }
                }
                
                return dp[0][arr.count - 1]
            }
        }
    }
    
}

