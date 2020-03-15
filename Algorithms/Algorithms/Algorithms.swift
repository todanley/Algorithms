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
}

