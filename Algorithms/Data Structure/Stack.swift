//
//  Stack.swift
//  Algorithms
//
//  Created by Stanley Jin on 15/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

struct Stack<T>
{
    private var arr = [T]()
    var isEmpty: Bool {
        return top == 0
    }
    
    var top: Int
    {
        return arr.count - 1
    }

    mutating func push(_ val: T)
    {
        arr.append(val)
    }
    
    mutating func pop()
    {
        if top == 0
        {
            fatalError("stack underflow")
        }

        arr = arr.dropLast()
    }
}
