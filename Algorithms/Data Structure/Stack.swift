//
//  Stack.swift
//  Algorithms
//
//  Created by Stanley Jin on 15/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

class Stack<T>
{
    private var arr = [T]()
    var isEmpty: Bool {
        return arr.count == 0
    }
    var top: T?
    {
        return arr.last
    }
    
    func push(_ val: T)
    {
        arr.append(val)
    }
    
    func pop()
    {
        arr = arr.dropLast()
    }
}
