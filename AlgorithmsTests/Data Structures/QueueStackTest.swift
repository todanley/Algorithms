//
//  QueueStackTest.swift
//  AlgorithmsTests
//
//  Created by Stanley Jin on 9/4/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import Foundation
import Algorithms

import XCTest
@testable import Algorithms

class QueueStackTest: XCTestCase {
    
    override func setUp() {
    }
    

    func testQueues() {
        let q1 = Queue<Int>(10)
        q1.enqueue(1)
        q1.enqueue(2)
        print(q1.dequeue())
        q1.enqueue(3)
        q1.enqueue(1)
        q1.enqueue(3)
        q1.enqueue(1)
        print(q1.dequeue())
        q1.enqueue(2)
        q1.enqueue(1)
        q1.enqueue(3)
        print(q1.dequeue())
        q1.enqueue(1)
        print(q1.dequeue())
        print(q1.dequeue())
        print(q1.dequeue())
        
        print("in betwwen)")

        var q2 = DQue<Int>()
               q2.enqueue(1)
               q2.enqueue(2)
               print(q2.dequeue())
               q2.enqueue(3)
               q2.enqueue(1)
               q2.enqueue(3)
               q2.enqueue(1)
               print(q2.dequeue())
               q2.enqueue(2)
               q2.enqueue(1)
               q2.enqueue(3)
               print(q2.dequeue())
               q2.enqueue(1)
               print(q2.dequeue())
               print(q2.dequeue())
               print(q2.dequeue())

    }
}
