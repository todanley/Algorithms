//
//  Stack.swift
//  Algorithms
//
//  Created by Stanley Jin on 15/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

struct Stack<T>: ArrBased where T: Equatable
{
    internal var arr = [T?]()
    var isEmpty: Bool {
        return arr.count == 0
    }
    
    var top: Int
    {
        return arr.count == 0 ? -1 : arr.count - 1
    }
    
    mutating func push(_ val: T)
    {
        arr.append(val)
    }
    
    mutating func pop() -> T
    {
        if top < 0
        {
            fatalError("stack underflow")
        }
        
        let res = arr[top]!
        arr = arr.dropLast()
        return res
    }
}

//struct StackUQ<T>
//{
//    private var q1 = Queue<T>()
//    private var q2 = Queue<T>()
//
//}
//}
