//
//  Queue.swift
//  Algorithms
//
//  Created by Stanley Jin on 4/4/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation

// Queue with dynamic length arr
class Queue<T>: ArrBased where T: Equatable
{
    init(_ size: Int) {
        arr = [T?].init(repeating: nil, count: size)
    }
    internal var arr: [T?]
    var head = 0
    var tail = 0
    
    var isFull: Bool
    {
        return head == tail ? arr[0] != nil : false
    }
    
    var isEmpty: Bool
    {
        return head == tail ? arr[0] == nil : false
    }

    func enqueue(_ element: T)
    {
        if !isFull
        {
            arr[tail] = element
            if tail == arr.count - 1
            {
                tail = 0
            }
            else
            {
                tail = tail + 1
            }
        }
        else
        {
            fatalError("Queue overflow")
        }
    }
    
    func dequeue() -> T?
    {
        if !isEmpty
        {
            let result = arr[head]
            if head == arr.count - 1
            {
                head = 0
            }
            else
            {
                head = head + 1
            }
            return result
        }
        else
        {
            fatalError("Queue underflow")
        }
    }
}

struct DQueue<T>: Equatable where T: Equatable
{
    var s1 = Stack<T>()
    var s2 = Stack<T>()
    
    mutating func enqueue(_ ele: T)
    {
        s1.push(ele)
    }
    
    mutating func dequeue() -> T
    {
        if s1.isEmpty && s2.isEmpty
        {
            fatalError("queue underflow")
        }
        
        if s2.isEmpty
        {
            while !s1.isEmpty
            {
                s2.push(s1.pop())
            }
        }
        
        return s2.pop()
    }
}

struct DQue<T>: Equatable where T: Equatable
{
    var s1 = Stack<T>()
    
    mutating func enqueue(_ ele: T)
    {
            var temp = Stack<T>()
            while s1.top > -1
            {
                temp.push(s1.pop())
            }
            
            s1.push(ele)
            while temp.top > -1
            {
                s1.push(temp.pop())
            }
    }
    
    mutating func dequeue() -> T
    {
        return s1.pop()
    }
}

protocol ArrBased: Equatable
{
    associatedtype Element: Equatable
    var arr: [Element?] { get set }
}

extension ArrBased
{
    static func ==(lhs: Self, rhs: Self) -> Bool
    {
        return lhs.arr == rhs.arr
    }
}
