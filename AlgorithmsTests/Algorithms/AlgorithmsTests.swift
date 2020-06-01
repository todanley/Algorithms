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
//        tree.root.right?.left?.left = TreeNoe(25)
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
        
//        let arr = [2,3,1,0,2,5,3,3,2,1,4,5,6]
//        print("abc")
//        print(shared.findDuplicate(arr))
        }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        
        
        let sd = Algorithms.shared
        let arr = [7,7,12,16,41,48,41,48,11,9,34,2,44,30,27,12,11,39,31,8,23,11,47,25,15,23,4,17,11,50,16,50,38,34,48,27,16,24,22,48,50,10,26,27,9,43,13,42,46,24]
        
//                let arr = [2,3,4,1]
        let res = Algorithms.DP.stoneGame.stoneGame(arr)
        print("res  ", res)
        
        let num = Algorithms.DP.stoneGameStand.stoneGame(arr)
        print("num", num)
        
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
