//
//  Queue.swift
//  Algorithms
//
//  Created by Stanley Jin on 4/4/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

// Queue with dynamic length arr
class Queue<T>
{
    private var arr = [T?]()
    var head = 0

    func enqueue(_ element: T)
    {
        arr.append(element)
    }
    
    func dequeue() -> T?
    {
        if !(head < arr.count)
        {
            return nil
        }
        else
        {
            let result = arr[head]
            arr[head] = nil
            head += 1
            return result
        }
    }
}
