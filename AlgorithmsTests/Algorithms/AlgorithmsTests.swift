//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Stanley Jin on 1/2/20.
//  Copyright © 2020 Stanley Jin. All rights reserved.
//

import XCTest
@testable import Algorithms

class AlgorithmsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let shared = Algorithms.shared

        // inorder: 12 3 4 5
//        let tree = BinaryTree(4)
//        tree.root.left = TreeNode(3)
//        tree.root.left?.left = TreeNode(1)
//        tree.root.left?.right = TreeNode(2)
//        tree.root.right = TreeNode(5)
        
        
//        let tree = BinaryTree(10)
//        tree.root.left = TreeNode(12)
//        tree.root.left?.left = TreeNode(25)
//        tree.root.left?.right = TreeNode(30)
//        tree.root.left?.left?.left = TreeNode(13)
//        tree.root.left?.left?.right = TreeNode(14)
//        tree.root.right = TreeNode(15)
//        tree.root.right?.left = TreeNode(36)
//        tree.root.right?.right = TreeNode(38)
//        tree.root.right?.left?.left = TreeNode(25)
//
//        let converted = tree.convertToDLL()
//
//
//        shared.printLL(converted)
//
//        let st = "4*3*3-2"
////        let value = shared.getValue(st)
////        let value = st.components(separatedBy: "*")
//        let value = st.seperate(times: 2)
//        print("er")
//        print(value)
//        var vals = [1,3,4,2]
//        vals.sort()
        
        let arr = [2,3,1,0,2,5,3,3,2,1,4,5,6]
        print("abc")
        print(shared.findDuplicate(arr))
        }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
