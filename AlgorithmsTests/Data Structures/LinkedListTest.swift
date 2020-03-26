//
//  LinkedListTest.swift
//  AlgorithmsTests
//
//  Created by Stanley Jin on 11/3/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import XCTest
@testable import Algorithms

class LinkedListTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func setUpSLL() -> SinglyListNode
    {
        return SinglyListNode(1, valArr: [2,3,4])
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testEqual() {
        XCTAssertEqual(SinglyListNode(0, valArr: [1, 2, 3]), SinglyListNode(0, valArr: [1, 2, 3]))
        XCTAssertNotEqual(SinglyListNode(0, valArr: []), SinglyListNode(1, valArr: []))
        XCTAssertNotEqual(SinglyListNode(1, valArr: [1,2]), SinglyListNode(1, valArr: [2, 1]))
    }
    
    func testSearch() {
        var ssl = setUpSLL()
        XCTAssertNil(SinglyListNode.search(ssl,val: 9))
        XCTAssertNil(SinglyListNode.search(ssl,val: 0))
        XCTAssertNil(SinglyListNode.search(ssl,val: 5))
        XCTAssertNil(SinglyListNode.search(ssl,val: 6))
        XCTAssertNil(SinglyListNode.search(ssl,val: 7))
        XCTAssertNil(SinglyListNode.search(ssl,val: 8))
        XCTAssertNil(SinglyListNode.search(ssl,val: 10))
        
        XCTAssertEqual(SinglyListNode.search(ssl, val: 2)?.val ?? 1000, 2)
        XCTAssertEqual(SinglyListNode.search(ssl, val: 4)?.val ?? 1000, 4)
    }
    
    func testInsert()
    {
        var ssl: SinglyListNode? = setUpSLL()
        SinglyListNode.insert(&ssl,val: 0)
        XCTAssertEqual(ssl, SinglyListNode(0, valArr: [1,2,3,4]))
    }

    func testDelete()
    {
        var ssl: SinglyListNode? = setUpSLL()
        SinglyListNode.delete(&ssl, val: 1)
        XCTAssertEqual(ssl, SinglyListNode(2, valArr: [3,4]))
        SinglyListNode.delete(&ssl, val: 4)
        XCTAssertEqual(ssl, SinglyListNode(2, valArr: [3]))
    }

    func setUpDLL() -> DoublyListNode
    {
        return DoublyListNode(1, valArr: [2,3,4])
    }

    func testDEqual() {
        let ddl = setUpDLL()
        XCTAssertEqual(ddl, DoublyListNode.init(1, valArr: [2,3,4]))
    }
}
